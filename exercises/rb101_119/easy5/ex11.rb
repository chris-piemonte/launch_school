=begin

input: integer
output: array of each digit of the integer
rules:
  explicit:
    - returned array contains each digit of integer as an element
  implicit:
    - a single digit integer returns a single element array
algorithm:
  - create a constant `NUMBERS` == 0-9 as strings
  - define a method `digit_list(integer)`
  - convert the `integer` to a string
  - split the string into an array of each character
  - iterate through the array, transforming each element unto an integer using `NUMBERS`

=end

# NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

# def digit_list(integer)
# integer.to_s.chars.map { |num| NUMBERS.index(num) }
# end

def digit_list(integer)
integer.to_s.chars.map(&:to_i)
end

p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true
