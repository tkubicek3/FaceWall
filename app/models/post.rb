# Post
class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts_likes, dependent: :destroy
  belongs_to :user
  belongs_to :gallery_image

  validates :content, :user_id, presence: true
  validates :gallery_image_id, uniqueness: true, allow_nil: true

  def self.search(query)
    where("#{:content} ILIKE ?", "%#{query}%")
  end

  def self.search_by_user(query)
    where('user_id IN (:ids)', ids: User.search(query).map(&:id)).order(created_at: :desc)
  end
end
