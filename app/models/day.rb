class Day < ApplicationRecord
  def pretty_calendar
    calendar.strftime "%A, %B %-d, %Y"
  end
end
