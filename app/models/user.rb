class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :avatar, :opt_in

  after_create :add_to_invited_plans
  before_create :assign_random_avatar
  before_destroy :destroy_comments

  has_many :owned_plans, :class_name => 'Plan', :foreign_key => 'user_id', :dependent => :destroy
  has_many :plan_memberships
  has_many :plans, :through => :plan_memberships

  validates :avatar,
    inclusion: { in: EmojiHelper::EMOJI_NAMES.map { |a| ":#{a}:"},
      message: "emoji %{value} does not appear to exist" }, :on => :update
  # min is small since chinese names are also expected
  validates :username, :length => { :in => 1..30 }
  validates :username, :uniqueness => true
  validates :username, :exclusion => { :in => %w[god], :message => 'is not allowed' }

  private

  # only for new users
  def assign_random_avatar
    self.avatar = EmojiHelper.random_emoji_avatar
  end

  # using comment plugin so need to delete comments manually
  #
  # cannot delete based on plan_detail association since those are tied to
  # plans, and only owned plans are associated with users
  def destroy_comments
    Comment.where(user_id: id).destroy_all
  end

  def add_to_invited_plans
    Invite.where(:email => self.email, :accepted => false).each do |invite|
      PlanMembership.find_or_create_by_user_id_and_plan_id(:user_id => self.id, :plan_id => invite.plan_id)
      invite.update_attribute(:accepted, true)
    end
  end
end
