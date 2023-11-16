=begin

PROBLEM
make a method to sort an array using bubble sort
input: array
output: same array object sorted from least to greatest value
rules:
  explicit:
    - itreate through entire array
    - sort 2 elements at a time
    - if the first element is greater than the second, swap them
    - stop iterating the first time we pass through the array without making any swaps
    - mutate the array passed as an argument
    each aray contains at least 2 elements
  implicit:
    - cannot use different object types as elements of argument array

DATA
arrays

ALGORITHM
  - define a method `bubble_sort!(array)
  - create 2 variables to represent the indeces of `array` being compared, set to 0 & 1
  - create a loop
    - create a new Array object equal to `array`
    - create a loop one less than array's length times
      - if the `array` element at index a is greater than at index b, swap them
      - increment a & b by 1
    - if the new array object == `array`, return `array`
    - reassign a & b to 0 & 1

=end

require 'pry'

def bubble_sort!(array)
  a, b = [0, 1]
  loop do
    comparison_array = Array.new(array)
    (array.length - 1).times do
      array[a], array[b] = array[b], array[a] if (array[a] <=> array[b]) == 1
      a += 1
      b += 1
    end
    return array if comparison_array == array
    a, b = [0, 1]
  end
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
