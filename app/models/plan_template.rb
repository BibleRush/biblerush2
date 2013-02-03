class PlanTemplate < ActiveRecord::Base
  attr_accessible :name, :desc, :passage_ref

  has_many :plan_template_details, :dependent => :destroy

  #validates :name, :presence => true, :uniqueness => true
  #validates :passage_ref, :presence => true

  default_scope order('position')

  # poor man's auto increment field
  before_create do |record| 
    record.position = self.class.where(name: record.name).count + 1
  end
end
