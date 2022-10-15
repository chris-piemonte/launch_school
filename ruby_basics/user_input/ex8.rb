def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop {
  puts "Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input, only integers are allowed"
}

loop {
  puts "Please enter the denominator:"
  denominator = gets.chomp
  if
    denominator == "0"
    puts "You cannot choose 0 as your denominator"
  else
    break if valid_number?(denominator)
    puts "Invalid input, only integers are allowed"
  end
}

answer = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} = #{answer}"