=begin

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

input: array
output: different array, first element moves to end of array
rules:
  explicit:
    - input array must not be mutated
    - first element becomes last element
  implicit:
    - array of one element will return itself
algorithm:
  - define a method `rotate_array`
  - initialize a new empty array to be the return value of the method
  - iterate through input array, pushing each element to the new array
  - delete the first element of the new array, add element object to end of the array
  -return the new array

=end

# def rotate_array(array)
#   new_array = []
#   array.each { |ele| new_array << ele }
#   new_array[new_array.length - 1] = new_array.delete_at(0)
#   new_array
# end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
