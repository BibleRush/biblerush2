class PlanDetail < ActiveRecord::Base
  attr_accessible :passage_ref, :assigned_date, :plan_id

  belongs_to :plan

  validates :plan_id, :passage_ref, :presence => true

  scope :ordered, order(:id)

  acts_as_commentable

  paginates_per 5
end
