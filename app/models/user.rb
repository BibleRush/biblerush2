class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :avatar

  before_create :assign_random_avatar
  before_destroy :destroy_comments

  has_many :plans, :dependent => :destroy

  validates :avatar,
    inclusion: { in: EmojiHelper::EMOJI_NAMES.map { |a| ":#{a}:"},
      message: "emoji %{value} does not appear to exist" }, :on => :update
  # min is small since chinese names are also expected
  validates :username, :length => { :in => 1..30 }
  validates :username, :exclusion => { :in => %w[god], :message => 'is not allowed' }

  private

  # only for new users
  def assign_random_avatar
    self.avatar = ":#{EmojiHelper::EMOJI_NAMES.sample}:"
  end

  # using comment plugin so need to delete comments manually
  #
  # cannot delete based on plan_detail association since those are tied to
  # plans, and only owned plans are associated with users
  def destroy_comments
    Comment.where(user_id: id).destroy_all
  end
end
