puts 'What is the bill?'
bill = gets.chomp.to_f
puts 'What % do you want to tip?'
tip = gets.chomp.to_f / 100

total_tip = (bill * tip).round(2)
total_bill = (bill + total_tip).round(2)
puts "The tip is $#{format("%.2f", total_tip)}."
puts "The total bill is $#{format("%.2f", total_bill)}."
