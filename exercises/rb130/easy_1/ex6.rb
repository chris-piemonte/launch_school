=begin

PROBLEM
input: array
output: boolean true/false
rules:
  explicit:
    - input is an array
    - output is true/false
    - output is determined if any element in the array passed to a block returns a truthy value
    - empty arrays return false
    - cannot use #all?, #any?, #none?, or #one?
  implicit:
    - will use an implicit block
DATA
array, #each iteration, implicit block

ALGORITHM
- define a method `any?(array)`
- iterate through each element of the array
- return tyue if any element yielded to a block returns a truthy value
- if iteration completes successfully, return false

=end

def any?(array)
  array.each { |ele| return true if yield(ele) == true }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
