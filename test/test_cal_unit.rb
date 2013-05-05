require 'test/unit'
require './my_cal.rb'

class UnitTestRubyCal < Test::Unit::TestCase

  def test_01_month_name_string
    cal = Calendar.new(2, 2012)
    assert_equal("February", cal.month_name)
  end

  def test_02_year_argument_passes
    cal= Calendar.new(2, 2012)
    assert_equal(2012, cal.year)
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

  def test_08_month_days_method_returns_31_days
    cal=Calendar.new(3, 2012)
    assert_equal(31, cal.month_days)
  end

  def test_09_month_days_method_returns_30_days
    cal=Calendar.new(9, 2012)
    assert_equal(30, cal.month_days)
  end

  def test_10_passing_in_month_year_returns_index_of_first_day
    cal=Calendar.new(2, 2012)
    assert_equal(3, cal.format_weeks)
  end

  def test_10_first_week_returns_right_number_of_days
    cal=Calendar.new(2, 2012)
    assert_equal([1, 2, 3, 4], cal.format_weeks)
  end

  # def test10B_first_week_prints_correctly
  #   cal=Calendar.new(2, 2012)
  #   assert_equal("          1  2  3  4", cal.format_first_4_weeks)
  # end

#   def test_14A_fourth_week_array_is_correct
#   cal=Calendar.new(2, 2012)
#   assert_equal([19, 20, 21, 22, 23, 24, 25], cal.format_weeks)
# end

#   def test_10C_fifth_week_calculated_properly
#     cal=Calendar.new(2, 2012)
#     assert_equal([26, 27, 28, 29], cal.format_weeks)
#   end

  #  def test10C_fifth_week_calculated_properly
  #   cal=Calendar.new(7, 2834)
  #   assert_equal([23, 24, 25, 26, 27, 28, 29], cal.format_weeks)
  # end

  # def test10D_sixth_week_calculated_properly
  #   cal=Calendar.new(7, 2834)
  #   assert_equal([30, 31], cal.format_weeks)
  # end

  # def test_11_month_greater_than_12_returns_error
  #   cal=Calendar.new(13, 1967)
  #   assert_equal("my_cal: 13 is neither a month number (1..12) nor a name", cal.month_number_error)
  # end

  # def test_12_month_passed_as_string_prints_capitalized
  #   cal=Calendar.new("february", 2012)
  #   assert_equal("February", cal.month_format)
  # end

  # def test_14_first_week_format_is_correct
  #   cal=Calendar.new(2, 2012)
  #   assert_equal("          1  2  3  4", cal.first_week)
  # end

#   def test_15_second_third_fourth_weeks_format_correctly
#     cal=Calendar.new(2, 2012)
#         test = <<-EOS
#           1  2  3  4
#  5  6  7  8  9 10 11
# 12 13 14 15 16 17 18
# 19 20 21 22 23 24 25
#     EOS
#     assert_equal(test, cal.format_first_4_weeks)
#   end

  # def test_16_wk5plus_format_is_correct_for_leap_year_febs
  #   cal=Calendar.new(2, 2012)
  #   assert_equal(29, cal.wk5_and_or_6)
  # end

  # def test_X_format_calendar_method_returns_formatted_calendar
  #   cal=Calendar.new(2, 2012) #my_cal returning 2 carriage returns at end of wk 4
  #   assert_equal("   February 2012\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n", cal.format_calendar)
  # end

end
