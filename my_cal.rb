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

  def first_week # adapted from http://steamcode.blogspot.com/2010_10_01_archive.html
    months = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2] #March-February, ordered per Zeller's congruence
    dayNames = %w[Su Mo Tu We Th Fr Sa]
    m = months.index(month.to_i) + 1
    y = (m <= 10) ? year.to_i : year.to_i-1 #truncated if statement. Cool, huh?
    d = y % 100
    c = y / 100
    f = (1 + (((13*m) - 1) / 5).floor + d + (d/4).floor + (c/4).floor - (2*c)) % 7
    first_day = dayNames[f]
    wk1_to_4 = [1..28]
    case first_day
      when "Su"
        <<-EOS
 1  2  3  4  5  6 7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
EOS
        # " " + wk1_to_4.join('  ')
      when "Mo"
        <<-EOS
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
EOS
      when "Tu"
        <<-EOS
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
EOS
      when "We"
        <<-EOS
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
EOS
      when "Th"
        <<-EOS
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
EOS
      when "Fr"
        <<-EOS
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
EOS
      when "Sa"
        <<-EOS
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
EOS
    end
  end
  # (1..31).each {|n| print n, ' ' }

  def print_calendar
  days= "Su Mo Tu We Th Fr Sa"
  puts= "#{month_year_header}" + "\n" + "#{days}" + "\n" + "#{first_week}" + "\n"
  end

end