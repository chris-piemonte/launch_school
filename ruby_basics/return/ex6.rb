# What will the following code print? Why?

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal

# It will print 'Breakfast' because return evaluates that line and immediately exits the method without executing the rest of the method.