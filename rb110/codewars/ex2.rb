=begin

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

PROBLEM
input: array of integers
output: smallest sum of 5 consecutive integers
rules:
  explicit:
    - if less than 5 elements return nil
  implicit:
    - positive and negative integers
    - no floats

DATA
nested arrays of sub-arrays

ALGORITHM
- define a method `minimum_sum(array)`
- create an array of all 5-element sub-arrays consecutive
  - create an empty array `sub_arrays`
  - create a loop array size - 4 times starting at 0
  - slize `array` from current loop index to current loop + 4, add to `sub_arrays`

- find sum of each sub-array
  - iterate through sub-arrays transformatively
    - sum each sub_array

- return smallest sum

=end

def minimum_sum(array)
  return nil if array.size < 5

  sub_arrays = []
  (array.size - 4).times { |ind| sub_arrays << array[ind..ind + 4] }

  sub_arrays.min_by { |sub| sub.sum }.sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
