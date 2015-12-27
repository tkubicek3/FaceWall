# Ability
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.has_role? :user
      users_set(user)
    end
  end

  def users_set(user)
    can :create, Post
    can [:update, :destroy], Post do |post|
      post.user_id == user.id
    end
    can :create, Comment
    can [:update, :destroy], Comment do |comment|
      comment.user_id == user.id
    end
    can :friends, User
    can [:update], User do |u|
      u.id == user.id
    end
    can :create, Gallery
    can [:update, :destroy], Gallery do |g|
      g.user_id == user.id
    end
    can :create, GalleryImage
    can [:update, :destroy], GalleryImage do |img|
      user.galleries.map { |g| g.id }.include?(img.gallery_id)
    end
  end

end
