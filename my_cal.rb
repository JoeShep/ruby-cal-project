class Calendar

  attr_reader :month, :year

  def initialize (month, year)
    @month = month
    @year = year
  end

 def month_number_error
    if month > 12
    "my_cal: #{month} is neither a month number (1..12) nor a name"
  end
 end

  def month_format
    if month.class == String
      month.capitalize
    end
  end

  def month_name
    month_names = %w[January February March April May June
      July August September October November December]
    month_names[month.to_i-1]
  end

  def month_year_header
    banner= "#{month_name} #{year}".center(20).rstrip
    banner
  end

  # def day_header
  #   days= "Su Mo Tu We Th Fr Sa"
  #   days
  # end

  def leap_year?
    if year % 400 == 0
      true
      elsif year % 100 == 0
        false
      elsif year % 4 == 0
          true
      else
        false
    end
  end

  def feb_days
    feb_days=28 unless leap_year?
      feb_days = 29
  end

  def month_days #without February
    case month when 4, 6, 9, 11
     30
    else
     31
    end
  end

# adapted from http://steamcode.blogspot.com/2010_10_01_archive.html

#   def date_day(day, month, year)
#     months = %w[march april may june july august september
#       october november december january february]
#     dayNames = %w[Sunday Monday Tuesday Wednesday
#       Thursday Friday Saturday]
#     q = day
#     m = months.index(month.downcase) + 1 #Need to ask mentor why months need to be lowercase
#     y = (m <= 10) ? year : year-1 #truncated if statement. Cool, huh?
#     d = y % 100
#     c = y / 100
#     f = (q + (((13*m) - 1) / 5).floor + d + (d/4).floor + (c/4).floor - (2*c)) % 7
#     dayNames[f] #floor rounds the result down to the neareast integer
# end

  def first_week
    dayNames = %w[Su Mo Tu We Th Fr Sa]
    q = 1 #only checking for first day of the month
    m = month.to_i + 1
    # p m
    y = (m <= 10) ? year.to_i : year.to_i-1 #truncated if statement. Cool, huh?
    d = y % 100
    c = y / 100
    f = (q + (((13*m) - 1) / 5).floor + d + (d/4).floor + (c/4).floor - (2*c)) % 7 +1
    # dayNames[f] #floor rounds the result down to the neareast integer
    first_day = dayNames[f]
    case first_day
      when "Su"
        " 1  2  3  4  5  6  7"
      when "Mo"
        "      1  2  3  4  5  6"
      when "Tu"
        "        1  2  3  4  5"
      when "We"
        "          1  2  3  4"
      when "Th"
        "            1  2  3"
      when "Fr"
        "              1  2"
      when "Sa"
        "                1"
    end
  end

  def print_calendar
  days= "Su Mo Tu We Th Fr Sa"
  puts= "#{month_year_header}" + "\n" + "#{days}" + "\n" + "#{first_week}" + "\n"
  end

end