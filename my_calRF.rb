class Calendar
  MaxDays = *(1..31) #splat to create array
  MonthNames = %w[January February March April May June
    July August September October November December]

    attr_reader :month, :year

    def initialize (month, year)
      @month = month.to_i
      @year = year.to_i
    end

    def month_year_errors
      if month > 12
        "my_cal: Entered #{month} is not a month number (1..12)."
      end
      if year < 1800 || year > 3000
        "my_cal: Year must be between 1800 and 3000. Please try again."
      end
    end

    def month_format
      if month.class == String
        month.capitalize
      end
    end

    def month_year_header
      banner= "#{MonthNames[month.to_i-1]} #{year}".center(20).rstrip
      banner
    end

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

    def month_days
      case month
      when 4, 6, 9, 11
       30
     when 1, 3, 5, 7, 8, 10, 12
      31
    when leap_year? && 2
      29
    else
     28
   end
 end

  def first_day_spot # adapted from http://steamcode.blogspot.com/2010_10_01_archive.html
    m = month
    d = year % 100
    if m == 1 || m == 2
      m += 12
      d = (d + 99) % 100
    end
    c = year / 100
    f = (1 + ((13*(m+1)) / 5).floor + d + (d/4).floor + (c/4).floor+5*c) % 7
    (f + 6) % 7
  end

  def format_days_array
    all_days=[]
    first_day_spot.times do
      all_days << "  "
    end
    month_days.times do
      all_days<< MaxDays.shift.to_s
    end
    all_days = all_days.each_slice(7).to_a
    all_days
  end

  def format_calendar
    puts month_year_header
    puts "Su Mo Tu We Th Fr Sa"
    format_days_array.each do |week_array|
        week_array.collect! { |date| date.to_s.rjust(2) }
        puts week_array.join(" ")
    end
  end

end