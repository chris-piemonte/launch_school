# What will the following code print? Why?

def meal
  'Dinner'
  puts 'Dinner'
end

p meal

# It will print 'Dinner' and nil because the method has a puts for 'Dinner' but the return value of puts is always nil so it will also print the return value of 'nil'.