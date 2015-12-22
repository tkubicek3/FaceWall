class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  # has_attached_file :photo, :styles => { :small => "150x150>", :large => "320x240>" }
  # validates_attachment_presence :photo
  # validates_attachment_size :photo, :less_than => 5.megabytes

  has_attached_file :photo,
                    :styles => {large: '800x800>', thumb: '100x100>'},
                    :path => ":rails_root/public/images/users/:styles/:id/:filename",
                    :url  => "/images/users/:styles/:id/:filename"

  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\Z}
  validates :photo, attachment_presence: true
end
