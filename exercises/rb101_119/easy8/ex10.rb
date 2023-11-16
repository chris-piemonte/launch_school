=begin

input: array of integers
output: integer, average of array
rules:
  explicit:
    - array will never be empty
    - numbers will always be positive integers
    - result is average of all numbers in array
    - cannot use Array#sum
algorithm:
  - define a method `average(array)`
  - create a variable `sum` equal to 0
  - iterage through `array`
    - add each element to `sum`
  - divide sum by the size of `array`

=end

# def average(array)
#   sum = 0
#   array.each { |num| sum += num}
#   sum / array.size
# end

def average(array)
  array.reduce(:+) / array.size.to_f
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
