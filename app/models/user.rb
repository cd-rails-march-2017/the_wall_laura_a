class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, :password, presence: true
  validates :password, :confirmation => true
  validates_confirmation_of :password, message: 'should match confirmation', on: :create
  validates_presence_of :password_confirmation, if: :password_changed?
end
