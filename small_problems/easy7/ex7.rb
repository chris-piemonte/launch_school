=begin

input: array of integers
output: integer rounded to 3 decimals
rules:
  explicit:
  - myltiply all integers by 3
  - divide that result by number of entries in the array
  - round resullt to 3 decimal places
algorithm:
  - define a method `show_multiplicative_average(array)`
  - multiply all elements of the array together
  - divide the answer of the multiplcation by `3.0` rounded to 3 decimals

=end

def show_multiplicative_average(array)
  number = array.inject(:*) / array.size.to_f
  format("%.3f", number)
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
