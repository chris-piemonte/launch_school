name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This will print out BOB, BOB because line 3 is mutating the caller which both name and save_name are pointing to
