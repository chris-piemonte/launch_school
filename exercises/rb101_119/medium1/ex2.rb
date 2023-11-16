=begin

Write a method that can rotate the last n digits of a number.

input: 2 integers, the first will be rotated the second tetermines how many digits from the right the rotation is taking place
output: integer with the last n digits rotated
rules:
  explicit:
    - rotate the last n digits of an integer
    - only the n'th integer from the right will be rotated to the end
    - n will always be positive
  implicit:
    - will return an integer
algorithm:
  - define a method `rotate_rightmost_digits(num, n)
  - initialize a variable and assign it to the input number as an array of digits
  - initialize a variable assigned to the length of the array
  - assign array to a new array using concatenation
    - for the left side return the array from 0 to array's length - n - 1
    - for the right side return the result of calling `rotate_array` on the input array from the array's length - n to the last element
  - return the array joined together to one string, then converted to an integer

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(num, n)
#   array = num.to_s.chars

#   if n < array.length
#     array = array[0..-n - 1] + rotate_array(array[-n..-1])
#     array.join.to_i
#   elsif n == array.length
#     rotate_array(array).join.to_i
#   end
# end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) #== 732915
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917
