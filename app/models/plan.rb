class Plan < ActiveRecord::Base
  attr_accessible :name, :creator

  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :plan_details, :dependent => :destroy

  validates :name, :presence => true
  validates :user_id, :presence => true

  def self.create_from_template(args)
    template   = args[:template]
    start_date = args[:start_date]
    user       = args[:user]

    user.plans.create(name: template.name).tap do |plan|
      template.plan_template_details.each do |ptd|
        plan.plan_details.build(passage_ref: ptd.passage_ref, assigned_date: start_date)

        start_date = start_date + 1.day
      end
    end
  end
end
