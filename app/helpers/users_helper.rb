# UsersHelper
module UsersHelper
  def author_email(post)
    User.find(post.user_id).email
  end
end
