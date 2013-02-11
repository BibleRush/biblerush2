class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body

  before_create :assign_random_avatar
  has_many :plans, :dependent => :destroy
  validates :avatar,
    inclusion: { in: EmojiHelper::EMOJI_NAMES.map { |a| ":#{a}:"},
      message: "emoji %{value} does not appear to exist" }, :on => :update

  private

  # only for new users
  def assign_random_avatar
    self.avatar = ":#{EmojiHelper::EMOJI_NAMES.sample}:"
  end
end
