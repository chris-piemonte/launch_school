=begin

input: integer
output: integer, variance b/w square of the sum of the first n positive integers & sum of the squares of the first n positive integers
rules:
  explicit:
    - argument integers will always be positive
    - one comparison number is the square of the sum of all integers from 1 to n
    - one comparison number is the sum of the square of all integers from 1 to 9
  implicit:
    - the square of sums will alwas be greater than the sum of squares
algorithm:
  - define a methiod `sum_square_difference(num)`
  - create a variable `square_sum` equal to the sum of 1 up to `num`, and square it
  - create a variable `sum_square` equal to the numbers (1 up to `num`) * 2 pushed into it
  - subtract `sum_square` from `square_sum`
=end

def sum_square_difference(num)
  square_sum = 0
  sum_squares = 0

  1.upto(num) do |num|
    square_sum += num
    sum_squares += num**2
  end

  square_sum**2 - sum_squares
end

p sum_square_difference(3) #== 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150
