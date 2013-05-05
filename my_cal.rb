class Calendar
  MaxDays = *(1..31) #splat to create array
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

  def year_error
    if year < 1800 || year > 3000
      "my_cal: Year must be between 1800 and 3000. Please try again."
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

  def month_days #without February
    case month when 4, 6, 9, 11
     30
   else
     31
   end
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

  def format_weeks # adapted from http://steamcode.blogspot.com/2010_10_01_archive.html
    months = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2] #March-February, ordered per Zeller's congruence
    dayNames = %w[Su Mo Tu We Th Fr Sa]
    m = months.index(month.to_i) + 1
    y = (m <= 10) ? year.to_i : year.to_i-1 #truncated if statement. Cool, huh?
    d = y % 100
    c = y / 100
    f = (1 + (((13*m) - 1) / 5).floor + d + (d/4).floor + (c/4).floor - (2*c)) % 7
    first_day_spot = dayNames.index(dayNames[f])

    wk1=MaxDays.shift(7 - first_day_spot)
    # second_week=MaxDays.shift(7)
    # second_weekA=second_week.reject {|number| number >9}
    # second_weekB=second_week.reject {|number| number < 10}
    # third_week=MaxDays.shift(7)
    # fourth_week=MaxDays.shift(7)

    # if self.leap_year? && month == 2
    #   fifth_week=MaxDays.reject {|number| number >29}
    # elsif month == 2
    #   fifth_week=MaxDays.reject {|number| number >28}
    # elsif month_days == 30
    #   fifth_week=MaxDays.reject {|number| number >30}
    # else
    #   fifth_week=MaxDays.reject {|number| number >31}
    # end
    #   sixth_week=[]
    #   if fifth_week.size > 7
    #     fifth_week=MaxDays.shift(7)
    #     sixth_week=MaxDays
    #   end

    # all_weeks = " "
    # first_day_spot.times do
    #   all_weeks << "   "
    # end

    # all_weeks << wk1.join('  ')
    # all_weeks << "\n" + " "
    # all_weeks << second_weekA.join('  ') + " "
    # all_weeks << second_weekB.join(' ')
    # all_weeks << "\n"
    # all_weeks << third_week.join(' ')
    # all_weeks << "\n"
    # all_weeks << fourth_week.join(' ')
    # all_weeks << "\n"
    # all_weeks << fifth_week.join(' ')
    # all_weeks << "\n"
    # all_weeks << sixth_week.join(' ')
    # all_weeks << "\n"
  end

  def format_calendar
  days= "Su Mo Tu We Th Fr Sa\n"
  output= month_year_header
  output << "\n"
  output << days
  output << format_weeks
  end
end