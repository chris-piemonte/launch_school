=begin

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place,
and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the 
first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the 
final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

input: integer
output: integer, max rotated
rules:
  explicit:
    - rotate the integer to the left
    - keep the first integer in place, then rorate the remaining digits
    - keep the first 2 integers in place, rotate the remaing digits, etc....
    - do not have to handle multiple 0s
  implicit:
    - single digit integers will return themselves
algorithm:
  - define a method `max_rotation(num)`
  - initialize a variable assigned to the length of num converted to a string
  - create a loop length of array times
    - reassign the array to the method call `rotate_rightmost_digits` with the array and array length variables as teh 2 arguments
    - reassign the length variable to itself - 1
  - return the array joined together and converted to an integer

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

# def max_rotation(num)
#   length = num.to_s.length
#   length.times do
#     num = rotate_rightmost_digits(num, length)
#     length -= 1
#   end
#   num
# end

def max_rotation(num)
  length = num.to_s.length
  length.downto(1) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
