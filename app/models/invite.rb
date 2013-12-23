class Invite < ActiveRecord::Base
  attr_accessible :plan_id, :email, :accepted

  belongs_to :plan
  validates :email, :presence => true
  validate :not_inviting_self, :not_already_invited
  before_create :assign_random_avatar, :add_member

  def self.pending_invites_for(id)
    where(:plan_id => id, :accepted => false).order('created_at DESC')
  end

  def self.accepted_invites_for(id)
    where(:plan_id => id, :accepted => true).order('updated_at DESC')
  end

  private

  def not_inviting_self
    plan = Plan.find(plan_id)
    errors.add(:invite, "can't invite yourself") if plan.creator.email == email
  end

  def not_already_invited
    user = User.where(:email => email).first

    if user
      already_invited_user = PlanMembership.where(:user_id => user.id, :plan_id => plan_id).first
      errors.add(:invite, "#{user.email} is already a member.") if already_invited_user
    end
  end

  def assign_random_avatar
    self.avatar = ":#{EmojiHelper::EMOJI_NAMES.sample}:"
  end

  def add_member
    existing_user = User.where(:email => email).first

    if existing_user
      PlanMembership.create(:user_id => existing_user.id, :plan_id => plan_id)
      self.accepted = true
      self.avatar = existing_user.avatar
    end
  end
end
