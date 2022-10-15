PASSWORD = "Abc1"

loop {
  puts "Please enter your password:"
  answer = gets.chomp
  break if PASSWORD == answer
  puts "Incorrect password!"
}

puts "Welcome!"


=begin
loop {
  puts "Please enter your password:"
  answer = gets.chomp.to_s
  if answer == password
    puts "Welcome!"
    break
  else
    puts "Incorrect password!"
  end
} 
=end