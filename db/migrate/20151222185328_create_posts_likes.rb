class CreatePostsLikes < ActiveRecord::Migration
  def change
    create_table :posts_likes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
