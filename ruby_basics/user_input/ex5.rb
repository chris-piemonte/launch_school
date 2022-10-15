lines = nil

loop {
  puts "How many output lines do you want? Enter a number of at least 3:"
  lines = gets.chomp.to_i
  break if lines >= 3
  puts "That's not enough lines!"
  }

while lines >= 0
  puts "Launch School is the best!"
  lines -= 1
end

=begin
puts "How many output lines do you want? Enter a number of at least 3:"
answer = gets.chomp.to_i

answer.times { puts "Launch School is the best!" }
=end