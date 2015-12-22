class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :comments_likes, dependent: :destroy
  belongs_to :user
  belongs_to :gallery_image

  validates :content, :user_id, presence: true
end
