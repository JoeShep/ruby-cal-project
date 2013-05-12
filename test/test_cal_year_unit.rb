require 'test/unit'
require './my_calRF.rb'
require './CalYear.rb'

class UnitTestRubyCal < Test::Unit::TestCase

  def test_1_year_greater_than_3000_returns_error
    assert_raise ArgumentError do
    Calendar.new(2, 3001)
   end
  end

  def test_2_error_if_year_argument_is_before_1800
    assert_raise ArgumentError do
    Calendar.new(2, 1799)
    end
  end

  def test_3_month_greater_than_12_returns_error
    assert_raise ArgumentError do
    Calendar.new(2, 3001)
   end
  end

  def test_4_passing_only_year_arg_works
    assert_nothing_raised do
      cal = Year.new(2012)
    end
  end

  # def test_5_year_array_populates
  #   cal=Calendar.new(2012)
  #   assert_equal([["January", "February", "March"], ["April", "May", "June"], ["July", "August", "September"], ["October", "November", "December"]], cal.months_headers)
  # end

  def test_6_month_rows_print_out
    cal=Year.new(2012)
    assert_equal(["      January       ", "  ","      February      ", "  ", "       March        ","  "], cal.format_months_rows)
  end

  def test_7_weeks_blocks_populate_year_array
    cal=Year.new(2000)
    weeks = <<-weeks
    weeks
    assert_equal(weeks, cal.weeks_blocks)
  end

  def test_8_months_populate_month_rows
    cal=Year.new(2000)
    months = <<-months
    months
    assert_equal(months, cal.format_months_rows)
  end

end
