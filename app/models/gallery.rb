# Gallery
class Gallery < ActiveRecord::Base
  has_many :gallery_images, dependent: :destroy
  accepts_nested_attributes_for :gallery_images, reject_if: ->(t) { t['gallery_image'].nil? }
  belongs_to :user

  validates :title, :user_id, presence: true
end
