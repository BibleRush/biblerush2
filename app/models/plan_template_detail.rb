class PlanTemplateDetail < ActiveRecord::Base
  attr_accessible :passage_ref

  belongs_to :plan_template

  #validates :plan_template_id, :presence => true
  #validates :passage_ref, :presence => true

  # poor man's auto increment field
  before_create do |record| 
    record.order = self.class.where(plan_template_id: record.plan_template_id).count + 1
  end
end
