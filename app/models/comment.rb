class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :comment, length: { minimum: 10 }, :presence => true
  validates :user_id, :post_id, :presence => true
end
