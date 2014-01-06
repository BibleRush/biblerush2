class Plan < ActiveRecord::Base
  attr_accessible :name, :creator

  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :plan_details, :dependent => :destroy
  has_many :plan_memberships
  has_many :users, :through => :plan_memberships
  has_many :invites, :dependent => :destroy

  validates :name, :presence => true
  validates :user_id, :presence => true

  def self.create_from_template(args)
    template   = args[:template]
    start_date = args[:start_date]
    user       = args[:user]

    user.owned_plans.create(name: template.name).tap do |plan|
      template.plan_template_details.each do |ptd|
        plan.plan_details.build(passage_ref: ptd.passage_ref, assigned_date: start_date)

        start_date = start_date + 1.day
      end

      assign_owner_as_member(plan)
    end
  end

  # TODO: counter cache
  def comments_count
    plan_details.sum { |pd| pd.comments_count }
  end

  def members
    users
  end

  def self.current_plans_for(user)
    user.plans.group('plans.id').joins(:plan_details)
        .where('plan_details.assigned_date > ?', Date.today).order('plans.id desc')
  end

  def self.finished_plans_for(user)
    user.plans.order('plans.id desc') - self.current_plans_for(user)
  end

  protected

  def self.assign_owner_as_member(plan)
    plan.plan_memberships.build(user_id: plan.creator.id, plan_id: plan.id)
  end
end
