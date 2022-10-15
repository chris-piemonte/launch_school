puts "Do you want to print 'something'? (y/n)"
answer = gets.chomp.downcase

puts "something" if answer == "y"