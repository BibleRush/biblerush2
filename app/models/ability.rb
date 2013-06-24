class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if signed_in?(user)
      can :manage, Plan, :user_id => user.id
      can :read, Plan do |plan|
        user.plans.include?(plan)
      end
    end
  end

  def signed_in?(user)
    user.id.present?
  end
end
