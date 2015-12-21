class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  # has_attached_file :photo, :styles => { :small => "150x150>", :large => "320x240>" }
  # validates_attachment_presence :photo
  # validates_attachment_size :photo, :less_than => 5.megabytes

  has_attached_file :photo,
                    :path => ":rails_root/public/images/users/:id/:filename",
                    :url  => "/images/users/:id/:filename"

  do_not_validate_attachment_file_type :photo
end
