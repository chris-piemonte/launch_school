=begin

PROBLEM
inpit: array
output: element with largest value
rules:
  explicit:
    - works like Array.max_by
    - empty input array should return nil

DATA
iteration

ALGORITHM
- define a method `max_by(array)`
- create a variable to point to the return value
- iterate through the array
  - if the element is greater than the return value, reassign it to the element
- return the return value
=end

def max_by(array)
  answer = array.first
  array.each do |ele|
    answer = ele if yield(ele) > yield(answer)
  end
  answer
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil
