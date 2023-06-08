=begin

input: 2 arguments, both an integer
output: integer from argument 1, rotated according to argument 2
rules:
  explicit:
    - first argument is the integer to be rotated
    - second argument determines the last n digets to be rotated
    - rotating 1 digit results in the original number being returned
    - n is always a positive integer
algorithm:
  - define a method rotate_rightmost_digits(num, digits)
  - create an array `num_array` where each element is a digit of `num` as a string
  - create a variable `left_digits` equal to `num_array` with the -`digits` to -1 elements removed
  - create a variable right_digits`` equal to `rotate_array` called on the -`digits` to -1 elements of `num_array`
  - concatnate `left_digits` and `right_digits` 

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(num, digits)
#   num_array = num.to_s.chars
#   left_digits = num_array[0..(-digits -1)]
#   right_digits = rotate_array(num_array[-digits..-1])
#   (left_digits + right_digits).join.to_i
# end

def rotate_rightmost_digits(num, digits)
  num_array = num.to_s.chars
  num_array[-digits..-1] = rotate_array(num_array[-digits..-1])
  num_array.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
