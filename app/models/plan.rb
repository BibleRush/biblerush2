class Plan < ActiveRecord::Base
  attr_accessible :name, :creator

  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :plan_details, :dependent => :destroy

  validates :name, :presence => true
  validates :user_id, :presence => true
end
