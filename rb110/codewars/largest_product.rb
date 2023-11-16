=begin

Complete the greatestProduct method so that it'll find the greatest
product of five consecutive digits in the given string of digits.

PROBLEM
input: string of digits
output: integer, greatest product of 5 consecutive digits in the input string
rules:
  explicit:
    - return gratest product of 5 consecutive digits
    - all stringgs have more than 5 digits
  implicit:
    - strings are only digits

DATA
array & nested sub-arrays

ALGORITHM
- define a method `greatest_product(n)`

- create a nested array of all 5 digit sub arrays
  - intialize an empty array
  - iterate over the characters of `n`, make into an array of integers
  - iterate through each of the integers or the array, with index
      - add to the empty array the string range from the index to the index + 4

- find the product of each sub-array
  - iterte over the array transformatively
    - replace the sub-arrays with their product

- return the gretest product

=end

def greatest_product(n)
  product_array = []
  characters = n.chars.map { |ele| ele.to_i }

  characters.each_with_index do |_, ind|
      product_array << characters[ind..ind + 4]
      break if ind == n.size - 5
  end

  product_array.map! { |sub_array| sub_array.inject(:*) }
  product_array.max
end

p greatest_product("123834539327238239583") #== 3240
