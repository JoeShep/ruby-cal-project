require 'test/unit'
require './my_calRF.rb'

class UnitTestRubyCal < Test::Unit::TestCase

  # def test_01_month_name_string
  #   cal = Calendar.new(2, 2012)
  #   assert_equal("February", cal.month_name)
  # end

  def test_02_year_argument_passes
    cal= Calendar.new(2, 2012)
    assert_equal(2012, cal.year)
  end

  def test_2A_error_if_year_argument_is_before_1800
    cal= Calendar.new(2, 1799)
    assert_equal("my_cal: Year must be between 1800 and 3000. Please try again.", cal.month_year_errors)
  end

  def test_2B_error_if_year_argument_is_after_3000
    cal= Calendar.new(2, 3001)
    assert_equal("my_cal: Year must be between 1800 and 3000. Please try again.", cal.month_year_errors)
  end

  def test_03_banner_format_is_correct
    cal=Calendar.new(2, 2012)
    assert_equal("   February 2012", cal.month_year_header)
  end

#   def test_04_years_divisisble_by_400_are_leap_years
#     cal=Calendar.new(2, 2012)
#     assert_equal(true, cal.leap_year?)
#   end

#   def test_05_years_divisible_by_100_but_not_400_are_normal
#     cal=Calendar.new(2, 1900)
#     assert_equal(false, cal.leap_year?)
#   end

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

  def test_10a_first_week_has_right_number_of_blanks
    cal=Calendar.new(2, 2012)
    assert_equal(3, cal.first_day_spot)
  end

  # def test_10C_all_weeks_contains_right_days
  #   cal=Calendar.new(2, 2012)
  #   assert_equal([[        1,  2,  3,  4], [ 5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29], cal.format_days_array)
  # end

# #   def test_14A_fourth_week_array_is_correct
# #   cal=Calendar.new(2, 2012)
# #   assert_equal([19, 20, 21, 22, 23, 24, 25], cal.format_weeks)
# # end

# #   def test_10C_fifth_week_calculated_properly
# #     cal=Calendar.new(2, 2012)
# #     assert_equal([26, 27, 28, 29], cal.format_weeks)
# #   end

#   #  def test10C_fifth_week_calculated_properly
#   #   cal=Calendar.new(7, 2834)
#   #   assert_equal([23, 24, 25, 26, 27, 28, 29], cal.format_weeks)
#   # end

#   # def test10D_sixth_week_calculated_properly
#   #   cal=Calendar.new(7, 2834)
#   #   assert_equal([30, 31], cal.format_weeks)
#   # end

  def test_11_month_greater_than_12_returns_error
    cal=Calendar.new(13, 1967)
    assert_equal("my_cal: Entered #{month} is not a month number (1..12).", cal.month_number_error)
  end

  def test_12_month_passed_as_string_prints_capitalized
    cal=Calendar.new("february", 2012)
    assert_equal("February", cal.month_format)
  end

#   def test_17_format_calendar_method_returns_formatted_calendar
#     cal=Calendar.new(2, 2012)
#     assert_equal("   February 2012\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n", cal.format_calendar)
#   end

end
