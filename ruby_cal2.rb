require 'my_cal.rb'

month = ARGV[0]
year = ARGV[1]

cal = Calendar.new(month, year)
puts cal.print_calendar