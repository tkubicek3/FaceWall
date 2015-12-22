class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts_likes, dependent: :destroy
  belongs_to :user
  belongs_to :gallery_image

  validates :content, :user_id, presence: true
end
