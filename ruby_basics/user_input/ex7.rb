USER_NAME = "chris"
PASSWORD = "Abc1"

loop {
  puts "Please enter your user name:"
  user_name_answer = gets.chomp.downcase
  puts "Please enter your password:"
  password_answer = gets.chomp

  break if USER_NAME == user_name_answer && PASSWORD == password_answer
  puts "Invalid user name or password!"
}

puts "Welcome!"