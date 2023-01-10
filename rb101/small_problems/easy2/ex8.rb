def prompt(string)
  puts ">> #{string}"
end

prompt "Enter an integer greater than 0."
num = gets.chomp.to_i

prompt "Enter 's' to compute the sum, or 'p' to compute the product."
answer = gets.chomp

case answer
  when 's'
    sum = 1.upto(num).inject { |sum, n| sum + n }
    puts "The sum of the integers between 1 & #{num} is #{sum}."
  when 'p'
    product = 1.upto(num).inject {|product, n| product * n }
    puts "The product of the integers between 1 & #{num} is #{product}."
  else
    prompt "Unknown entry."
end

# case answer
# when 's'
#   1.upto(num) { |i| sum += i }
#   puts "The sum of the integers between 1 & #{num} is #{sum}."
# when 'p'
#   1.upto(num) { |i| product *= i }
#   puts "The product of the integers between 1 & #{num} is #{product}."
# else
#   prompt "Unknown entry."
# end
