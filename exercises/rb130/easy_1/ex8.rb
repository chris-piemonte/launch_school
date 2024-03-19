=begin

PROBLEM
input: array
output: boolean true/false
rules:
  explicit:
    - input is an array
    - output is true/false
    - output is false if any element in the array passed to a block returns a truthy value
    - empty arrays return false
    - cannot use #all?, #any?, #none?, or #one?
  implicit:
    - will use an implicit block

DATA
array, #each iteration, implicit block

ALGORITHM
- define a method `none?(array)`
- iterate through each element of the array
- return false if any element yielded to a block returns a truthy value
- if iteration completes successfully, return true

=end

# def none?(array)
#   array.each { |ele| return false if yield(ele) == true }
#   true
# end

require 'pry'

def any?(array)
  array.each { |ele| return true if yield(ele) == true }
  false
end

def none?(array, &block)
  !any?(array, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
