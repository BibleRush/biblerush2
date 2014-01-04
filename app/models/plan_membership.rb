class PlanMembership < ActiveRecord::Base
  attr_accessible :user_id, :plan_id

  belongs_to :user
  belongs_to :plan

  validates :user_id, :uniqueness => { :scope => :plan_id }
  validates :user_id, :presence => true
  validates :plan_id, :presence => true
end
