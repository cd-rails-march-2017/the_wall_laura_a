class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :post, length: { minimum: 10 }, :presence => true
  validates :user_id, :presence => true

end
