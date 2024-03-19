=begin

PROBLEM
input: arbitrary number of arguments
output: number of arguments that return trithy when passed to a block
rules
  explicit:
    - there can be any number of arguments
    - each argument will be passed to a block
    - return the number of arguments that yield returns a truthy value
  implicit:
    - 0 argments returns 0

DATA
array, counter

ALGORITHM
- defne a method `count(*arg)`
- iterate through the `arg` array with `reduce`, setting the default value to 0
- add 1 to the value if the element yeilded to the block returns truthy
- return the value
=end

def count(*arg)
  arg.reduce(0) { |sum, ele| yield(ele)? sum + 1 : sum }
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
