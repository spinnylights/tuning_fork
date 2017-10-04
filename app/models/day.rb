class Day < ApplicationRecord
  def pretty_calendar
    calendar.strftime "%A, %B %e, %Y"
  end
end
