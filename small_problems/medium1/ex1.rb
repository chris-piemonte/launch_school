=begin

input: array
output: array
rules:
  explicit:
    - first elemtt moved to end of the array
    - original array should not be modified
algorithm:
  - define an array `rotate_array(aray)`
  - create a variable `first_element` equal to the first element of `array`
  - iterate through `array` with index using `map`
    - each element = index + 1
    - if the index + 1 == the size of `array`, the element = `first_element`

=end

# def rotate_array(array)
#   first_element = array[0]

#   array.each_with_index.map do |ele, ind|
#     if array.size > ind + 1
#       ele = array[ind + 1]
#     elsif ind + 1 == array.size
#       ele = first_element
#     end
#   end
# end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(num)
  rotate_array(num.to_s.chars).join.to_i
end

p rotate_string('abcde')
p rotate_integer(12345)

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true
