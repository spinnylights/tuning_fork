require 'test_helper'

class DayTest < ActiveSupport::TestCase
  def new_weekday
    date = Date.new(2017,10,4) # Wednesday
    Day.new(calendar: date)
  end

  def new_saturday
    date = Date.new(2017,10,7) # Saturday
    Day.new(calendar: date)
  end

  def new_sunday
    date = Date.new(2017,10,8) # Saturday
    Day.new(calendar: date)
  end

  def test_pretty_calendar_formatting
    expected = "Wednesday, October 4, 2017"
    assert_equal expected, new_weekday.pretty_calendar
  end

  def test_new_day_without_date_has_no_task_groups
    day = Day.new
    assert_empty day.task_groups
  end

  def test_any_day_with_date_is_made_with_task_group
    [new_weekday, new_saturday, new_sunday].each do |day|
      assert_not_empty day.task_groups
    end
  end

  def test_weekday?
    assert new_weekday.weekday?
  end
end
