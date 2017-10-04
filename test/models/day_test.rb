require 'test_helper'

class DayTest < ActiveSupport::TestCase
  def test_pretty_calendar_formatting
    date = Date.new(2017,10,4)
    day  = Day.new(calendar: date)
    expected = "Wednesday, October 4, 2017"

    assert_equal expected, day.pretty_calendar
  end
end
