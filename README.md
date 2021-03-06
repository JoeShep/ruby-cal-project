my_cal.rb  project
================

Implementation of the Linux "cal" program in Ruby. Assignment for Nashville Software School cohort 2.
This is an exercise in test-driven development (TDD). When completed, this program will
contain integration tests and unit tests that confirm the functionality of the methods.

May 13 update:
Full functionality of year and month calendars.

May 8 update: Post refactoring
My odd, large, funky code is no more. What a difference a peer code review and help from Nashville 
Software school mentor Ben Bridges makes! Much smaller code overall, and it uses better practices
that will make the next phase easier to implement (printing out a whole year). Original code now in 
the "cal-pre-refactor" folder just for comparison's sake.

May 5 update:
Spacing issue fixed. Very excited to have this working properly! Ruby is proving to be a fun environment. I enjoyed thinking
through the logic of a possible solution and finding that Ruby allowed me to write code that followed my logic (even if 
my logic was circuitous). Looking forward to tweaking the unit tests and refactoring after other folks look at this code.

May 3 update:
Calendar program now runs! Need to figure out how to fix spacing issue when a week contains both single and double digit 
dates. Also need to refine tests so they all pass with current code.

May 1 update:
Current files reflect transition from small, isolated methods to larger, integrated methods. Still writing
and updating unit tests to reflect the changing methods. 

Can now run ruby_cal2.rb from the command line, passing a month (As a number. Passing as a string 
will come later) and a year as arguments. Prints the month and year header, the days of the week header, 
and the first week of the month.

April 30 update:
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
 
 
        
        




