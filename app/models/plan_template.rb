class PlanTemplate < ActiveRecord::Base
  attr_accessible :name, :desc, :passage_ref

  has_many :plan_template_details, :dependent => :destroy

  #validates :name, :presence => true, :uniqueness => true
  #validates :passage_ref, :presence => true

  # poor man's auto increment field
  before_create do |record| 
    record.order = self.class.where(name: record.name).count + 1
  end
end
