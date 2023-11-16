=begin

input: array
output: nested array of 2 arrays
rules:
  explicit:
    - nested array must contain 2 arrays
    - first half of array goes in 1st nested array, second half of array goes in 2nd nested array
    - if odd number of elements, 1st array gets middle element
  implicit:
    - if 1 element, 2nd array will be empty
    - if no elements, will return nested array with 2 empty arrays
algorithm:
  - define a method `halvsies(array)`
  - initialize 2 variables, `first_array` & `second_array`
  - iterate through `array` with index
    - if the index is <= half the array size, add the element to `first_array`
    - else add it to`second_array`
  - initialize an array `result`
  - push both `first_array` & `second_array` to `result` and return it

=end

# def halvsies(array)
#   first_array = []
#   second_array = []

#   if array.size % 2 == 0
#     array.each_with_index do |ele, ind|
#       first_array << ele if ind < array.size / 2
#       second_array << ele if ind >= array.size / 2
#     end
#   else
#     array.each_with_index do |ele, ind|
#       first_array << ele if ind <= array.size / 2
#       second_array << ele if ind > array.size / 2
#     end
#   end
  
#   result = []
#   result << first_array
#   result << second_array
# end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_array = array[0, middle]
  second_array = array[middle, array.size - middle]
  [first_array, second_array]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
