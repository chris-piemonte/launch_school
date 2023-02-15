def triangle(num)
  blanks = num - 1
  stars = 1

  loop do
    puts "#{' ' * blanks}#{'*' * stars}"
    blanks -= 1
    stars += 1
    break if stars > num
  end
end

triangle(5)

triangle(9)
