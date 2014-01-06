class PlanTemplate < ActiveRecord::Base
  attr_accessible :name, :desc, :passage_ref, :user_id

  has_many :plan_template_details, :dependent => :destroy
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'

  validates :user_id, :presence => true
  validates :name, :presence => true

  default_scope order('position')

  # poor man's auto increment field
  before_create do |record|
    record.position = self.class.where(name: record.name).count + 1
  end
end
