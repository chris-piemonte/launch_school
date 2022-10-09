# What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

# it will print "Xy-zy" because while numbers are immutable and assignment merely changes the object that a variable references, strings are mutable and b[2] is a specific mutating method.