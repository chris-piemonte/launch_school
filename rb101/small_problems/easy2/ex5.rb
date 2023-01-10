puts 'What is yur name?'
name = gets.chomp

if name.include?('!')
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SHOUTING?!"
else
  puts "Hello #{name}, how are you?"
end
