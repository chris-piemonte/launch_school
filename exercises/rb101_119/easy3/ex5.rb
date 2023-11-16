def multiply(x, y)
  x * y
end

def square(num)
  multiply(num, num)
end

# p square(5) == 25
# p square(-8) == 64

def power_to_the_n(num, n)
  multiply(num, num) * (num ** (n-2))
end

p power_to_the_n(10, 4)
p power_to_the_n(5, 3)
