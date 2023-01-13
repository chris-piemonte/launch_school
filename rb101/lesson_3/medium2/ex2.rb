a = 42
b = 42
c = a

puts a.object_id # same
puts b.object_id # same
puts c.object_id # same

# integers are immutable, they cannot be mutated, so there is only one integer object per integer
