
month = ARGV[0]
year = ARGV[1]

puts `cal #{month} #{year}`

#pseudo code and notes

# def month_year_header(month, year)
#     puts  "     #{month} #{year}"
#   end

# adapted from wiki pseudocode
# if year is divisible by 400 then
#    is_leap_year
# elsif year is divisible by 100 then
#    not_leap_year
# elsif year is divisible by 4 then
#    is_leap_year
# else
#    not_leap_year