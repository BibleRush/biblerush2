class PlanMembership < ActiveRecord::Base
  attr_accessible :user_id, :plan_id

  belongs_to :user
  belongs_to :plan
end
