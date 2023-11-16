=begin

input: 2 arrays
output: new array containing product of every pair ofnumbers that can be formed between the 2 arrays
rules:
  explicit:
    - every pair from the 2 arrays multiplied together
    - results sorted by increasing values
    - neither array is empty
  implicit:
    - arrays can be different lengths
    - result numbers can repeat
algorithm:
  - define a method `multiply_all_pairs(array1, array2)`
  - create an empty array `result`
  - create a `counter` variable = 0
  - iterate through `array1`
    - assign `counter` to 0
    - `array2`'s lenght amount of times do
      - element * the value at the `array2` index of `counter`
      - push the result to `result`
      - increment `counter` by 1
    - end `times` iteration
  - end `array1` iteration
  - return `result` sorter numerically
=end

# def multiply_all_pairs(array1, array2)
#   result = []
#   counter = 0

#   array1.each do |ele|
#     counter = 0
#     array2.size.times do
#       result << ele * array2[counter]
#       counter += 1
#     end
#   end

#   result.sort
# end

def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |sub_array| sub_array.inject (:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
