=begin

Given a List [] of n integers , find minimum number to be inserted in a list,
so that sum of all elements of list should equal the closest prime number .

PROBLEM
input: array of integers
output: integer that sums with array of integers to equal next prime number
rules:
  explicit:
    - array size is at least 2
    - all array integers positive
    - repetitions of numbers can occur
  implicit:
    - no floats
    - answer can be 0 if sum is prime number

DATA
helper method, array

ALGORITHM
- define a method `prime_number?(num)`
  - start a loop from 2 up to num - 1
    - if num % loop num == 0, return false
  - return true

- define a method `minimum_number(array)`

- find the next prime number
  - intialize a variable `sum` equal to sum of array
  - initialize a variable `next_num` = 0
  - call `prime_number?` on sum + next_num
    - if true, return next_num
    - if false increment next_num

=end

def prime_number?(num)
  2.upto(num - 1) do |loop_num|
    return false if num % loop_num == 0
  end
  true
end

def minimum_number(array)
  sum = array.sum
  next_num = 0

  loop do
    break if prime_number?(sum + next_num) ==  true
    next_num += 1
  end

  next_num
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
