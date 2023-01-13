def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "punpkins"
puts "My array looks like this now: #{my_array}"   # "Pumpkins" "Rutebega"

# they are different because the string paramater is not beinig mutated because String#+= operation is re-assignment and creates a new string object, so my_string and a_string_param no longer point to the same object
# because the local variable an_array_param still points to the original object that my_array is and Aray#<< mutates the caller, it is mutating the object my_array is pointing to.
