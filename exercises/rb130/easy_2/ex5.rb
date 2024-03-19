=begin

PROBLEM
input: array
output: new array, all elements inclusive after an element passed to a block returns falsey
rules
  explicit:
    - pass all elements to a block
    - keep iterating if result of block is truthy
    - when block returns falsey, return a new array of this and all later elements
  implicit:
    - empty array should return empty array
    - every element yielded to block returning truthy, output should return empty array

DATA
iterating with index

ALGORITHM
- define a method `drop_while(array)`
- iterate through the array with index
- if the element yielded to a block returns falsey, return new array from current index to last index of input array
- if itration copletes return an empty array
=end

def drop_while(array)
  array.each_with_index { |ele, ind| return array[ind..-1] unless yield(ele) }
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
