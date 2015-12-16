# UsersHelper
module UsersHelper
  def author_email(post)
    User.find(post.user_id).email
  end
end

def last_login_format(date_time)
  date = Date.parse(date_time.to_s)

  if date == Date.today
    'Today'
  elsif date == Date.yesterday
    'Yesterday'
  elsif (date > Date.today - 7) && (date < Date.yesterday)
    'This week'
  else
    date.to_s
  end
end