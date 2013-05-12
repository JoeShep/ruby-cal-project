
require 'cal_year.rb'

year = ARGV[0]

calYear = CalYear.new(month, year)
calYear.format_calendar