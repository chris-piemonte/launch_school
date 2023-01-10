puts 'Want to know how long until you retire'
puts 'Enter your age:'
age = gets.chomp.to_i
puts 'And what age would you like to retire?:'
retire_age = gets.chomp.to_i
years_to_work = retire_age - age

puts "It is #{Time.now.year}. You will retire in #{Time.now.year + years_to_work}."
puts "You have #{years_to_work} more years to work!"
