# def divisors(num)
#   array = []
#   1.upto(num) { |n| array << n if num % n == 0 }
#   array
# end

require 'pry'

# def divisors(num)
#   if num.even?
#     num = num / 2
#     array = []
#     1.upto(num) { |n| array << n if num % n == 0 }
#     array2 = []
#     array.each { |num| array2 << num * 2 }
#     (array + array2).uniq.sort
#   else
#     answer = []
#     array = (1..num).select { |num| num.odd? }
#     array.each { |n| answer << n if num % n == 0 }
#     answer
#   end
# end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
