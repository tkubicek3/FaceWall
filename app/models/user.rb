# User
class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_friendship

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  has_attached_file :cover_photo, styles: {medium: '850x315>', thumb: '270x100>'}
  validates_attachment_content_type :avatar, :cover_photo, content_type: %r{\Aimage\/.*\Z}

  after_create :default_role

  def self.add_friendship(friendable, user)
    friendable.friend_request(user)
  end

  def self.update_friendship(friendable, user, way)
    return friendable.accept_request(user) if way == 'accept'
    return friendable.decline_request(user) if way == 'decline'
  end

  def self.remove_friendship(friendable, user)
    friendable.remove_friend(user)
  end

  def self.search(query)
    where("#{:full_name} ILIKE ? OR #{:email} ILIKE ?", "%#{query}%", "%#{query}%")
  end

  private

  def default_role
    add_role(:user) if roles.blank?
  end
end
