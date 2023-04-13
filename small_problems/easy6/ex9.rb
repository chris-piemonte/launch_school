=begin

input: array, search value
output: true or false
rules:
  explicit:
    - must have 2 paramaters, an array and a value to search for in the array
    - may not use Array#include?
  implicit:
    - either paramater can be nil
algorithm:
  - define a method `include?(array, value)`
  - create a variable `result` = `false`
  - iterate through the array
    - if the element == `value` assign `return` to `true`
  - return `result`

=end

# def include?(array, value)
#   array.each { |element| return true if element == value }
#   false
# end

def include?(array, value)
  !!array.find_index(value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
