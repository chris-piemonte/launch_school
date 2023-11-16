=begin

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752.

input: integer
output: integer
rules:
  explicit:
    - input integer is year
    - output i number of Friday the 13ths in the year
    - the input is always greter than 1752

DATA
Date class

ALGORITHM
- requre the Date class
- define a method `friday_13th(year)`
- set a `date` variable asssigned to the first day of the input year
- set a counter variable `number` to keep count of the number of Friday the 13ths
- start a loop until the year in `date` is one greter than input year
  - if the day is Friday and the 13th
    - increment `number` by one
  - reassign `date` to the next  day
- return `number`

=end

require 'date'

def friday_13th(year)
  date = Date.new(year)
  fridays = 0

  until date.year == year + 1
    fridays += 1 if date.friday? && date.day == 13
    date = date.next_day
  end

  fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
