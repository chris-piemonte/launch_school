=begin

PROBLEM
input: array
output: boolean true/false
rules:
  explicit:
    - input is an array
    - output is true/false
    - output is determined if every element in the array passed to a block returns a truthy value or not
    - empty arrays return false
    - cannot use #all?, #any?, #none?, or #one?
  implicit:
    - will use an implicit block

DATA
array, #each iteration, implicit block

ALGORITHM
- define a method `any?(array)`
- iterate through each element of the array
- return false if any element yielded to a block returns a falsey value
- if iteration completes successfully, return true

=end

def all?(array)
  array.each { |ele| return false if yield(ele) == false }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
