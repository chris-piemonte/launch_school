=begin

input: positive integer
output: sum of its digits
rules:
  explicit:
    - the integer will always be positive
algorithm:
  - define a method `sum(num)`
  - use a method to turn `num` into a string
  - split the string
  - turn each element of the new array into an integer
  - sum the integers in the array

=end

def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

puts sum(23) #== 5
puts sum(496) #== 19
puts sum(123_456_789) #== 45
