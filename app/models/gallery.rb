class Gallery < ActiveRecord::Base
  has_many :gallery_images, :dependent => :destroy
  accepts_nested_attributes_for :gallery_images, :reject_if => lambda { |t| t['gallery_image'].nil? }
end
