=begin

input: integer
output: integer, index of fibinachi number that hits digits of input integer
rules:
  explicit:
    - result must be index of fibiniachi numebr that hits number of digits of input integer (how many times until it's that many digits)
  implicit:
    - must start at 2 digits because fininachi starts with two 1s automatically
algorithm:
  - define a method `find_fibinacci_index_by_length(num)`
  - define 2 variables, `a` and `b`, both equal to 1
  - create a counter set to 2
  - start a loop
    - if `counter` is even, a = a + b, else b = a + b
    - counter += 1
    - return counter if a or b == `num`

=end

def find_fibonacci_index_by_length(num)
  a = 1
  b = 1
  counter = 2

  loop do
    if counter.even?
      a = a + b
    else
      b = a + b
    end
    counter += 1
    break if (a.to_s.length >= num || b.to_s.length >= num)
  end
  counter
end


p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847
