class PostsLike < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :post_id, :user_id, presence: true
end
