class PlanDetail < ActiveRecord::Base
  attr_accessible :passage_ref, :assigned_date, :plan_id

  belongs_to :plan

  validates :plan_id, :passage_ref, :presence => true

  acts_as_commentable
end
