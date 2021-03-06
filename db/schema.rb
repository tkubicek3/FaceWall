# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_151_222_185_419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.integer 'gallery_image_id'
    t.integer 'post_id'
    t.datetime 'created_at',       null: false
    t.datetime 'updated_at',       null: false
  end

  create_table 'friendships', force: :cascade do |t|
    t.integer 'friendable_id'
    t.string 'friendable_type'
    t.integer 'friend_id'
    t.string 'status'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'galleries', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'gallery_images', force: :cascade do |t|
    t.integer 'gallery_id'
    t.datetime 'created_at',         null: false
    t.datetime 'updated_at',         null: false
    t.string 'photo_file_name'
    t.string 'photo_content_type'
    t.integer 'photo_file_size'
    t.datetime 'photo_updated_at'
  end

  create_table 'posts', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.integer 'gallery_image_id'
    t.datetime 'created_at',       null: false
    t.datetime 'updated_at',       null: false
  end

  create_table 'posts_likes', force: :cascade do |t|
    t.integer 'post_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.integer 'resource_id'
    t.string 'resource_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'roles', %w(name resource_type resource_id), name: 'index_roles_on_name_and_resource_type_and_resource_id', using: :btree
  add_index 'roles', ['name'], name: 'index_roles_on_name', using: :btree

  create_table 'users', force: :cascade do |t|
    t.string 'email',                    default: '', null: false
    t.string 'encrypted_password',       default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at',                            null: false
    t.datetime 'updated_at',                            null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.string 'full_name', null: false
    t.string 'cover_photo_file_name'
    t.string 'cover_photo_content_type'
    t.integer 'cover_photo_file_size'
    t.datetime 'cover_photo_updated_at'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
  end

  add_index 'users_roles', %w(user_id role_id), name: 'index_users_roles_on_user_id_and_role_id', using: :btree
end
