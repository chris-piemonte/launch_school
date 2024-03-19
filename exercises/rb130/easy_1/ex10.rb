=begin

PROBLEM
input: array
output: integer
rules
  explicit:
    - count the number of elementsin an array that return true when yielded to a block
    - cannot use #count
  implicit:
    - empty arrays should return 0

DATA
array, block, counter

ALGORITHM
  - define a method `count(array`
  - set a counter to 0
  - iterate through each element of the array
    - increment the counter by 1 if the block yield returns true
  - return the counter

=end

# def count(array)
#   counter = 0
#   array.each { |ele| counter += 1 if yield(ele) }
#   counter
# end

def count(array)
  array.reduce(0) { |sum, ele| yield(ele) ? sum + 1 : sum }
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
