class Comment < ActiveRecord::Base
  attr_accessible :title, :comment, :user_id, :commentable_id
  belongs_to :commentable, :polymorphic => true, :counter_cache => :comments_count
  attr_readonly :comments_count

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at DESC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  validates :comment, :length => { :minimum => 2 }
end
