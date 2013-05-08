require 'my_calRF.rb'

month = ARGV[0]
year = ARGV[1]

cal = Calendar.new(month, year)
cal.format_calendar