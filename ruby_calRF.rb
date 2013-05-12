require 'CalYear.rb'

if ARGV[1].nil?
  year = ARGV[0].to_i
  cal = Year.new(year)
  cal.print_year_calendar
else
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  cal = Calendar.new(month, year)
  cal.print_month_calendar
end
