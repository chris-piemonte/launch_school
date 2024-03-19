=begin

PROBLEM
input: array
output: boolean true/false
rules:
  explicit:
    - input is an array
    - output is true/false
    - output is true if exactly one element in the array passed to a block returns a truthy value
    - empty arrays return false
    - stop counter after finding second true element and return false
    - cannot use #all?, #any?, #none?, or #one?
  implicit:
    - will use an implicit block

DATA
array, #each iteration, implicit block, counter

ALGORITHM
- define a method `none?(array)`
- create a counter for number of times block returns true
- iterate through each element of the array
- increment counter by 1 if element yielded to a block returns a truthy value
- return false unless counter == 1

=end

def one?(array)
  counter = 0
  array.each do |ele|
    counter += 1 if yield(ele)
    return false if counter >= 2
  end
  counter == 1? true: false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
