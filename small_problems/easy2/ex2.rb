SQMETERS_TO_FEET = 10.7639

puts 'What is the size of your room'
puts 'length in meters:'
length = gets.chomp.to_f
puts 'width in meters:'
width = gets.chomp.to_f

puts "The area of your room is #{(length * width).round(2)} square meeters"
puts "Or #{(length * width * SQMETERS_TO_FEET).round(2)} square feet"
