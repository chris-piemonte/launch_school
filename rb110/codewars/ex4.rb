=begin

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

PROBLEM
input: array of integers
output: array of 2 values with smallest variance
rules:
  explicit:



ALGORITHM
- define a emthod `closest_numbers(array)`
- create array of all 2-element sub-arrays
- create an empty array
  - start a loop from 0 to array size
    - start a loop from 1 to array size - 1
    - add array of current element, array at index from loop to empty array

- sort all sub-arrays
- return sub-array where element 2 - element 1 is smallest

=end

def closest_numbers(array)
  sub_arrays = []
  array.each_with_index do |ele1, ind|
    (ind + 1).upto(array.size - 1) do |ele2|
      sub_arrays << [ele1, array[ele2]]
    end
  end

  sub_arrays.min_by { |sub| sub.sort[1] - sub.sort[0] }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
