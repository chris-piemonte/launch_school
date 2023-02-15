def print_in_box(string)
  empty = ''
  dashes = ''
  string.size.times do |index|
    empty << ' '
    dashes << '-'
  end

  puts "+-#{dashes}-+"
  puts "| #{empty} |"
  puts "| #{string} |"
  puts "| #{empty} |"
  puts "+-#{dashes}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
