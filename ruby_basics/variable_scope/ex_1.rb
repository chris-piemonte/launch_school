# What will the following code print and why? Don't run it until you have tried to answer.

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# it will print 7 because the 10 being added to it is only in the scope of the method my_value.