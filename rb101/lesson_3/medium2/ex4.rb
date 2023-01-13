def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# This time the local variable an_array_param is being reassignes to a new object and no longer points to the same object_id as my_array,
# while a_string_param is being mutated while pointing to the same object_id as my_string.
