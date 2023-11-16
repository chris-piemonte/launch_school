=begin

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Additionally, if the number is negative, return 0.
Note: If the number is a multiple of both 3 and 5, only count it once.

PROBLEM
input: integer
output: sum of all numbers below input multiples of 3 or 5
rules:
  explicit:
    - numbers can only be included once
    - if the number is negative return 0
  implicit:
    - all integers, no floats

DATA
array

ALGORITHM
- define a method `multiples(num)`

- make an array of all multiples less than `num` and divisible by 3 or 5
  - initialize an empty array
  - iterate from 1 to `num` - 1
    - if current number modulo 3 or 5 == 0 add to the array
  - delete duplicates from the array

- sum the array

=end

def multiples(number)
  array = []
  1.upto(number - 1) { |num| array << num if num % 3 == 0 || num % 5 == 0 }

  array = array.uniq
  array.sum
end

p multiples(10)
