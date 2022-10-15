answer = nil

loop {
  puts "Do you want to print 'something'? (y/n)"
  answer =gets.chomp.downcase
  break if %w(y n).include?(answer)
  puts "Invalid answer, please put 'y' or 'n'"
}

