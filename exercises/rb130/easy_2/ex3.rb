=begin

PROBLEM
input: array
output: new array, elemnts transformed
rules
  explicit:
    - return a new Array that contains the return values produced by the block for each element of the original Array.
    - if array is empty, should return an empty array
    - do not iterate through any collection other than input array

DATA
arrays

ALGORITHM
- define a method `map(array)`
- create an empty array
- iterate through the argument array
- push the return value of the current element yielded to the block to the new array
- return the new array
=end

def map(array)
  new_array = []
  array.each { |ele| new_array << yield(ele) }
  new_array
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
