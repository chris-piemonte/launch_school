=begin

nput: integer
output: integer
rules:
  explicit:
    - return the nth fibonacci number, where nth is the argument to the method
    - do not use recursion
    - the first and second fibonacci numbers are both 1
    - each fibonacci number is the sum of the previous 2 numbers
  implicit:
    - all inputs are whole numbers
algorithm:
    - define a method `fibonacci(n)`
    - if n <= 2 return 1
    - create a variable `sum` = 1
    - create a variable `num1` = 1
    - create a variable `num2` = 1
    - start a loop, n - 2 times do
      - set `num2` = `num1`
      - set `num1` = `sum`
      - set `sum` = `num1 + num2`
    - return sum
=end

# def fibonacci(n)
#   return 1 if n <= 2
#   sum = 1
#   num1 = 1
#   num2 = 1

#   (n-2).times do
#     num1 = num2
#     num2 = sum
#     sum = num1 + num2
#   end
#   sum
# end

def fibonacci(n)
  num1, num2 = [1, 1]

  (n-2).times do
    num1, num2 = [num2, num1 + num2]
  end
  num2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001)
