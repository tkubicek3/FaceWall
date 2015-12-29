# Ability
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    users_set(user) if user.has_role? :user
  end

  def users_set(user)
    ab_post(user)
    ab_comments(user)
    ab_user(user)
    ab_gallery(user)
    ab_images(user)

  end

  private

  def ab_post(user)
    can :create, Post
    can [:update, :destroy], Post do |post|
      post.user_id == user.id
    end
  end

  def ab_comments(user)
    can :create, Comment
    can [:update, :destroy], Comment do |comment|
      comment.user_id == user.id
    end
  end

  def ab_user(user)
    can :friends, User
    can [:update], User do |u|
      u.id == user.id
    end
  end

  def ab_gallery(user)
    can :create, Gallery
    can [:update, :destroy], Gallery do |g|
      g.user_id == user.id
    end
  end

  def ab_images(user)
    can [:create, :post_with_image], GalleryImage
    can [:update, :destroy], GalleryImage do |img|
      !user.galleries.where(id: img.gallery_id).empty?
    end
  end
end
