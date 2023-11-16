=begin

input: 2 array arguments
output: 1 array with elements alternating between the 2 input arrays
rules:
  explicit:
    - the result array will take the elements from both input arrays in alteration
    - both arrays are non-empty and have the same number of elements
  implicit:
    - the fisrst element comes from array 1
    - element can be any type
algorithm:
  - define a method `interleave(array1, array2)`
  - create an empty array `combined_array`
  - create 2 variables, `array1_counter` & `array2_counter` both set to 0
  - create a loop that runs the number of times of the sizes of both arrays added together
    - if the iteration is on an even number of times, add the element in `array1` at index `array1_counter` to `combined_array`
    - increment `array1_counter` by 1
    - if the iteration is on an odd number of times, add the element in `array2` at index `array2_counter` to `combined_array`
    - increment `array2_counter` by 1
  - return `combined_array`

=end

# def interleave(array1, array2)
#   combined_array = []
#   array1_counter = 0
#   array2_counter = 0

#   (array1.size + array2.size).times do |iteration|
#     if iteration.even?
#       combined_array << array1[array1_counter]
#       array1_counter += 1
#     else
#       combined_array << array2[array2_counter]
#       array2_counter += 1
#     end
#   end

#   combined_array
# end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']
