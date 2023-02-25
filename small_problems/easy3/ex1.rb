def prompt(string)
  puts "==> #{string}"
end

prompt "Enter the 1st number:"
first = gets.chomp.to_i

prompt "Enter the 2nd number:"
second = gets.chomp.to_i

prompt "Enter the 3rd number:"
third = gets.chomp.to_i

prompt "Enter the 4th number:"
fourth = gets.chomp.to_i

prompt "Enter the 5th number:"
fifth = gets.chomp.to_i

prompt "Enter the last number:"
last = gets.chomp.to_i

arr = []
arr.push(first, second, third, fourth, fifth)

if arr.include?(last)
  prompt "The number #{last} appears in #{arr}!"
else
  prompt "The number #{last} does NOT appear in #{arr}."
end
