require 'test/unit'
require './my_calRF.rb'

class UnitTestRubyCal < Test::Unit::TestCase

  def test_02_year_argument_passes
    cal= Calendar.new(2, 2012)
    assert_equal(2012, cal.year)
  end

  def test_2A_error_if_year_argument_is_before_1800
    assert_raise ArgumentError do
    Calendar.new(2, 1799)
    end
  end

  def test_2B_error_if_year_argument_is_after_3000
    assert_raise ArgumentError do
    Calendar.new(2, 3001)
    end
  end

  def test_03_banner_format_is_correct
    cal=Calendar.new(2, 2012)
    assert_equal("   February 2012", cal.month_year_header)
  end

  def test_04_years_divisisble_by_400_are_leap_years
    cal=Calendar.new(2, 2012)
    assert_equal(true, cal.leap_year?)
  end

  def test_05_years_divisible_by_100_but_not_400_are_normal
    cal=Calendar.new(2, 1900)
    assert_equal(false, cal.leap_year?)
  end

  def test_06_yrs_divisible_by_4_are_leap_years
    cal=Calendar.new(2, 2000)
    assert_equal(true, cal.leap_year?)
  end

  def test_07_month_days_method_returns_29_days
    cal=Calendar.new(2, 2012)
    assert_equal(29, cal.month_days)
  end

  def test_07A_month_days_method_returns_28_days
    cal=Calendar.new(2, 2013)
    assert_equal(28, cal.month_days)
  end

  def test_08_month_days_method_returns_31_days
    cal=Calendar.new(3, 2012)
    assert_equal(31, cal.month_days)
  end

  def test_09_month_days_method_returns_30_days
    cal=Calendar.new(9, 2012)
    assert_equal(30, cal.month_days)
  end

  def test_10_passing_in_month_year_calculates_index_of_first_day
    cal=Calendar.new(2, 2012)
    assert_equal(3, cal.first_day_spot)
  end

  def test_10C_all_weeks_contains_right_days
    cal=Calendar.new(2, 2012)
    array=[["  ", "  ", "  ", " 1", " 2", " 3", " 4"],
 [" 5", " 6", " 7", " 8", " 9", "10", "11"],
 ["12", "13", "14", "15", "16", "17", "18"],
 ["19", "20", "21", "22", "23", "24", "25"],
 ["26", "27", "28", "29", "  ", "  ", "  "],
 ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
    assert_equal(array, cal.format_days_array)
  end

  def test_11_month_greater_than_12_returns_error
    assert_raise ArgumentError do
    Calendar.new(13, 1967)
   end
  end

  def test_17_format_calendar_method_returns_formatted_calendar
    cal=Calendar.new(2, 2012)
    assert_equal("   February 2012\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n", cal.print_month_calendar)
  end

end
