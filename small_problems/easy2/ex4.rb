puts "I can tell you ho many years until you will retire! How old are you?"
age = gets.chomp.to_i
puts "And what age would you like to retire?"
retirement_age = gets.chomp.to_i

current_year = Time.now.year
years_until_retirement = (retirement_age - age)
retirement_year = current_year + years_until_retirement

puts "It is #{current_year}, you will retire in #{retirement_year}."
puts "You have #{years_until_retirement} years of work to go!"
