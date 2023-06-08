=begin

input: integer
output: integer, maximum rotated
rules:
  explicit:
    - maximum rotate the input integer
    - use the methods from the previous 2 examples
algorithm:
  - create an additional method `rotate_leftmost_digits(num, digits)`
    - create a variable `num_array` equal to `num` as an array of the digits as strings
    - mutate `num_array` so the left digits from element 0 to digits - 1 are rotated using the `rotate_array` method
    - join `num_array` into a string, and convert it into an integer

  - define a method `max_rotation(num)`
  - set a variable `rotations_left` equal to the length of `num` - 1
  - set a variable `start_index` equal to 0
  - create an array `num_array` equal to `num` converted to an array of strings
  - start a loop
    - set `num_array` elements `start_index` to end of array equal to `rotate_array` methos called ou `num_array` elements `start_index` to end of array
    - increment `start_index` by 1
    - reduce `rotattions_left` by 1
    - break if `rotation_left` == 0
  - join num_array into a string and convert it into an integer

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, digits)
  num_array = num.to_s.chars
  num_array[-digits..-1] = rotate_array(num_array[-digits..-1])
  num_array.join
end

# def max_rotation(num)
#   rotations_left = num.to_s.size - 1
#   start_index = 0
#   num_array = num.to_s.chars

#   loop do
#     num_array[start_index..-1] = rotate_array(num_array[start_index..-1])
#     start_index += 1
#     rotations_left -= 1
#     break if rotations_left <= 0
#   end

#   num_array.join.to_i
# end

def max_rotation(num)
  number_digits = num.to_s.size
  number_digits.downto(2) { |n| num = rotate_rightmost_digits(num, n) }
  num.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(1000456)
p max_rotation(123000456)
