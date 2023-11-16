=begin

PROBLEM
input: integer, n
output: integer, n in the fibonacci series
rules:
  explicit:
    - must use recursion
    - n will be the nth integer in the bibonacci sequence

DATA
sums with variables

ALGORITHM
- define a method `fibonacci(n)`
- initialize a variable `last_value` = 1 to store the last fibonacci number
- initialize the variable `current_value` = 1 to store the current fibonacci number
- create a variable `fibonacci_index` set to 1 for the return condition
- create a return condition if `fibonacci_index` == n, return `current_value`
- set the equation `current_value += last_value`

=end


def fibonacci(n)
  return 1 if n == 2
  return 1 if n == 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(45)
