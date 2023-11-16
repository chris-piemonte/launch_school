=begin

input: integer
output: integer
rules:
  explicit:
    - double numbers are the same on the left half as they are the right
    - if a numebr is a double number, return 2 the number as-is
      - if it isn't a double number, return the number * 2
  implicit:
    - odd numbers can't be double numbers
algorithm:
  - define a method `twice(num)`
  - return `num` if the length of `num` is odd
  - create a variable called `num_string` that is `num` represented as a string
  - start an if statement:
    - if the first half of `num_string` == the second hald of `num_string`
      - num * 2
    - else
      - num

=end

def twice(num)
  return num * 2 if num.to_s.length.odd?

  num_string = num.to_s
  half = num.to_s.length / 2

  if num_string[0..half - 1] == num_string[half..]
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
