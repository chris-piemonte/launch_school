=begin

input: year in integer form
output: integer, number of Friday the 13ths in the year
rules:
  explicit:
    - output number of Friday the 13ths in argument yer
    - argument year always greater than 1752
algorithm:
  - 
=end

require 'date'

def friday_13th(year)
  count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end

require 'pry'

def months_with_five_fridays(year)
  five_friday_count = 0
  day = Date.civil(year, 1, 1)
  month = 1

  12.times do
    count = 0
    until day.month == month + 1
      count += 1 if day.friday?
      day = day.next_day
      break if day.year == year + 1
    end
    five_friday_count += 1 if count == 5
    month += 1
  end
  five_friday_count
end

def five_fridays(year)
  count = 0
  1.upto(12) do |month|
    fridays = 0
    day = Date.new(year, month, 1)
    day.upto(day.next_month.prev_day) { |date| fridays += 1 if date.wday == 5 }
    count += 1 if fridays == 5
  end
  count
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

p months_with_five_fridays(2023)
p months_with_five_fridays(2024)
p months_with_five_fridays(2027)

p five_fridays(2023)
p five_fridays(2024)
p five_fridays(2027)
