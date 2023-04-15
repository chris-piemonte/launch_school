=begin

input: 2 arguments, each an array conaining a list of numbers
output: new array containing the product of each pair of numbers at the same index
rules:
  - multiply the numbers together from matching indices
  - both argument arrays contain the same number of elements
algorithm:
  - define a method `multiply_list(array1, array2)`
  - create an empty array `result`
  - itterate through `array1` with index
    - push to `result` the product of the element in `array1`` and the value at the current index of `array2`
  - return `result`

=end

# def multiply_list(array1, array2)
#   result = []
#   array1.each_with_index { |ele, ind| result << ele * array2[ind] }
#   result
# end

def multiply_list(array1, array2)
  array1.zip(array2).map { |sub_array| sub_array.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
