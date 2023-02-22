def prompt(string)
  puts ">> #{string}"
end

prompt "Enter an integer greater than 0:"
integer = gets.chomp.to_i
prompt "Enter 's' to compute the sum or 'p' to compute the product:"
answer = gets.chomp.downcase

if answer == 's'
  prompt (1..integer).inject(:+)
elsif answer == 'p'
  prompt (1..integer).inject(:*)
else
  prompt "You did not enter 's' or 'p'."
end
