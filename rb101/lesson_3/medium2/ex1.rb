a = "forty two"
b = "forty two"
c = a

puts a.object_id # same
puts b.object_id # different, they are different strings
puts c.object_id # same
