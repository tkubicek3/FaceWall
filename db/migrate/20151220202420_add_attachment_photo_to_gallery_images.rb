class AddAttachmentPhotoToGalleryImages < ActiveRecord::Migration
  def self.up
    change_table :gallery_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :gallery_images, :photo
  end
end
