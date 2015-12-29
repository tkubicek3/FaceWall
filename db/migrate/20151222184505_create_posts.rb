# Migrate
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :gallery_image_id

      t.timestamps null: false
    end
  end
end
