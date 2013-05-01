my_cal.rb  project
================

Implementation of the Linux "cal" program in Ruby. Assignment for Nashville Software School cohort 2.
This is an exercise in test-driven development (TDD). When completed, this program will
contain integration tests and unit tests that confirm the functionality of the methods.

When a month and year are passed as arguments, my_cal will use the following methods to print 
a calendar of that month in the format of the original cal program:

	 print_month_year( month, year ), which needs:
        month_year_header(month, year)
        day_header
        get_first_of_month(month, year)
        format_month(month,year)
        
 Helper methods I have created as of April 30, 2013:<br>
        leap_year? -Boolean check for leap year status.<br>
        month_number  -Throws error if month arg is > 12.<br>
        month_format  -Capitalizes month if month arg is passed as string instead of a number.<br>
        month_name -Converts month arg to capitalized string if passed as a number.<br>
        feb_days -Sets February to 28 or 39 days depending on leap year status.<br>
        month_days -Assigns 30 or 31 days to months that aren't February.<br>
        date_day(day, month, year)  -Matches dates with the proper day of the week.<br>
        
        




