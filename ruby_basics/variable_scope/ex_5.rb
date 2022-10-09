# What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# it will print "Xyzzy" because although strings are mutable we are not calling a mutating method on it. Assignment never changes the value of an object, it creates a new object, 
# and stores a reference to that object in the variable on the left. So at the end of my_value, b references the string 'yzzyX' while a remins unchanged. b = 'yzzyX' is object assignment, 
# while b[2] = '-' is a method call using the method []= which updates the string referenced by b. It does not change the reference, so a is also referencing the modified string.