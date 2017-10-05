class Day < ApplicationRecord
  has_many :task_groups

  after_initialize :autofill_if_calendar_provided

  def pretty_calendar
    calendar.strftime "%A, %B %-d, %Y"
  end

  def weekday?
    calendar.monday? || calendar.tuesday? || calendar.wednesday? ||
    calendar.thursday? || calendar.friday?

  end

  private

    def autofill_if_calendar_provided
      if calendar
        if weekday?
          task_groups.new.make_personal_hygeine_group
          task_groups.new.make_work_group
        elsif calendar.saturday?
          task_groups.new.make_personal_hygeine_group
          task_groups.new.make_laundry_group
        elsif calendar.sunday?
          task_groups.new.make_personal_hygeine_group
          task_groups.new.make_housecleaning_group
        end
      end
    end
end
