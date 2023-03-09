def print_in_box(string)
  length = string.size

  num_of_text_lines = length / 76 + 1
  
  if length <= 76
    top_and_bottom = "+-#{"-" * length}-+"
    middle = "|#{" " * (length + 2)}|"
    text = "| #{string} |"

    puts top_and_bottom
    puts middle
    puts text
    puts middle
    puts top_and_bottom
  elsif length > 76
    top_and_bottom = "+#{'-' * 78}+"
    middle = "| #{' ' * 76} |"
    iterations_left = num_of_text_lines
    
    puts top_and_bottom
    puts middle
    loop do
      puts "| #{string[0..75]} |"
      string.delete_prefix!(string[0..75])
      iterations_left -= 1 
      if iterations_left == 1
        puts "| #{string[0..] + ' ' * (76 - length % 76)} |"
        break
      end
    end
    puts middle
    puts top_and_bottom
  end
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before.')
