def prompt(string)
  puts "==> #{string}"
end

loop do
  prompt"Enter the first number:"
  first = gets.chomp.to_f
  break if first != 0
end

loop do
  prompt "Enter the second number:"
  second = gets.chomp.to_f
  break if second != 0
end

addition = (first + second).round(2)
subtraction = (first - second).round(2)
mult = (first * second).round(2)
quot = (first / second).round(2)
remain = (first % second).round(2)
power = (first ** second).round(2)

prompt "#{first} + #{second} = #{addition}"
prompt "#{first} - #{second} = #{subtraction}"
prompt "#{first} * #{second} = #{mult}"
prompt "#{first} / #{second} = #{quot}"
prompt "#{first} % #{second} = #{remain}"
prompt "#{first} ** #{second} = #{power}"
