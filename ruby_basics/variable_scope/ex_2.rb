# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# it will print 7 for the same reason as the previous example. Reassignment does not mutate a variable, it binds the variable to a new object.