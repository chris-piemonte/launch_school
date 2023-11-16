def prompt(string)
  puts "=> #{string}"
end

numbers = []

prompt "Enter the 1st number:"
numbers << gets.chomp
prompt "Enter the 2nd number:"
numbers << gets.chomp
prompt "Enter the 3rd number:"
numbers << gets.chomp
prompt "Enter the 4th number:"
numbers << gets.chomp
prompt "Enter the 5th number:"
numbers << gets.chomp
prompt "Enter the last number:"
num6 = gets.chomp

if numbers.include?(num6)
  puts "The number #{num6} appears in #{numbers}!"
else
  puts "The number #{num6} does not appear in #{numbers}."
end
