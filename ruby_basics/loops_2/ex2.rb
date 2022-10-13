loop do
  number = rand(100)
  puts number
  break if number.between?(1, 10)
end