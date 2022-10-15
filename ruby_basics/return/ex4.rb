# What will the following code print? Why?

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

# It will print both 'Dinner' and 'Breakfast' because the method puts 'Dinner' ebfore it returns 'Breakfast'