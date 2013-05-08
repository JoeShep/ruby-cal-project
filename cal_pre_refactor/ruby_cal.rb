require 'my_cal.rb'

month = ARGV[0].to_i
year = ARGV[1].to_i

cal = Calendar.new(month, year)
puts cal.format_calendar