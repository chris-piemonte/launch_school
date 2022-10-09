# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# it creates an error because a definted before my_value and is therefore not visible inside it, so my_value has the undefined local variable a.