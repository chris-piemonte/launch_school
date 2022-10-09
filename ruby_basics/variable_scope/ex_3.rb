# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# it will put 7 because the local variable a inside the my_value method definition is not visibly outside my_value, and the top level variable a is not visible inside my_value.