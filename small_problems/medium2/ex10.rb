=begin

Write a method that computes the difference between the square of the sum of the
first n positive integers and the sum of the squares of the first n positive integers.

PROBLEM
input: integer
output: integer, difference between the square sof the sum of the first n positive integers
        and the sum of the quares of the first n positive integers
rules
  eplicit:
    - input is positive integer
    - for the sum square sum each number 1 to n, then square it
    - for the square sum square each number 1 to n, then sum themm

DATA
arrays

ALGORITHM
- define a mehtod `sum_square_difference(n)`
- initialize an array `sum_square` assigned to the elements 1 to n
- initialize an array `square_sum` assigned to the elements 1 to n
- sum `sum_square` and square the result
- squre each element in `square_sum`, then sum it
- subtract sum_square - square_sum

=end

def sum_square_difference(n)
  sum_square = (1..n).to_a
  square_sum = (1..n).to_a
  sum_square.sum.**(2) - square_sum.map { |num| num.**(2) }.sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
