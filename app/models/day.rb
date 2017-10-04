class Day < ApplicationRecord
  has_many :task_groups

  def pretty_calendar
    calendar.strftime "%A, %B %-d, %Y"
  end
end
