def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop {
    puts "Please enter a positive or negative number:"
    number = gets.chomp
    return number.to_i if valid_number?(number)
    puts "Invalid entry!"
  }
end

integer1 = nil
integer2 = nil

loop {
  integer1 = get_number
  integer2 = get_number
  break if integer1 * integer2 < 0
  puts "One integer needs to be positive and one needs to be negative, start over."
}

answer = integer1 + integer2
puts "#{integer1} + #{integer2} = #{answer}"