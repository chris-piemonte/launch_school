=begin

PROBLEM
write a Procedural method that calculates the nth number in the fibonacci sequence
input: integer
output: integer
rules:
  explicit:
    - calculate the nth integer in the fibonacci sequence
    - cannot use recursion
  implicit:
    - n will always be a positive integer

DATA
array

ALGORITHM
- define a method `fibonacci(n)
- initialize an array with 2 elements, both 1
- start a loop n times, adding the last 2 elements or array and pushing it to array
- return the last element of array

=end

def fibonacci(n)
  array = [1, 1]
  (n - 2).times { array << array[-2..-1].sum }
  array.last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) #= 4202692702.....8285979669707537501
