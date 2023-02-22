puts "Let me calculate the tip for you!"
puts "What is the bill?"
bill = gets.chomp.to_f
puts "What % do you want to tip?"
tip_percent = gets.chomp.to_f

tip = bill * (tip_percent / 100)
total_bill = (bill + tip).round(2)

puts "The tip is $#{tip}."
puts "The total bill is $#{total_bill}."
