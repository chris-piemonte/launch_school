=begin

input: integer
output: integer
ruules:
  explicit:
    - return the nth fibonacci number, where nth is the argument to the method
    - use recursion
    - the first and second fibonacci numbers are both 1
    - each fibonacci number is the sum of the previous 2 numbers
  implicit:
    - all inputs are whole numbers
algorithm:
  - define a method `fibonacci(n)`
  - return 1 if `n` < 2
  - `fibonacci(n-1) + fibonacci(n-2)``

=end

def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
