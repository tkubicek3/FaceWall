# Ability
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      users_set(user)
    else
      can :read, :all
    end
  end

  def users_set(user)
    can :create, Post
    can [:update, :destroy], Post do |post|
      post.user_id == user.id
    end
    can :read, :all
  end
end
