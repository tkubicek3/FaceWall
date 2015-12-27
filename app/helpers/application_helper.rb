# AppHelper
module ApplicationHelper
  def date_format(date_time)
    date = Date.parse(date_time.to_s)

    if date == Date.today
      return 'Today'
    elsif date == Date.yesterday
      return 'Yesterday'
    elsif (date > Date.today - 7) && (date < Date.yesterday)
      return 'This week'
    else
      date_time.strftime("at %H:%M %d/%m/%Y")
    end
  end
end
