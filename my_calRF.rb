class Calendar
  MaxDays = *(1..31) #splat to create array
  MonthNames = %w[January February March April May June
    July August September October November December]

    attr_reader :month, :year

    def initialize (month, year)
      @month = month.to_i
      @year = year.to_i

      if @month > 12
        raise ArgumentError, "my_cal: #{month} is not a month number (1..12)."
      end
      if @year < 1800 || @year > 3000
        raise ArgumentError, "my_cal: Year must be between 1800 and 3000. Please try again."
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

  def first_day_spot #uses Zeller's congruence formula
    m, y = month, year
    m = (m += 9) % 12
    y = y - (m / 10)
     (1 + ((m + 1) * 26 / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
  end

  def format_days_array
    all_days=[]
    first_day_spot.times do
      all_days << "  "
    end
    month_days.times do
      all_days<< MaxDays.shift.to_s
    end
    (42-(first_day_spot + month_days)).times do
    all_days << " "
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