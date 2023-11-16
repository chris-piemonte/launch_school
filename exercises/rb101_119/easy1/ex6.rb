def triangle(n, right_angle = "bottom right")
  bottom_spaces = n - 1
  bottom_stars = 1
  top_spaces = 0
  top_stars = n

  n.times do |x|
    if right_angle == "bottom right"
      puts (" " * bottom_spaces) + ("*" * bottom_stars)
      bottom_spaces -= 1
      bottom_stars += 1
    elsif right_angle == "bottom left"
      puts ("*" * bottom_stars) + (" " * bottom_spaces)
      bottom_spaces -= 1
      bottom_stars += 1
    elsif right_angle == "top right"
      puts (" " * top_spaces) + ("*" * top_stars)
      top_spaces += 1
      top_stars -= 1
    elsif right_angle == "top left"
      puts ("*" * top_stars) +  (" " * top_spaces)
      top_spaces += 1
      top_stars -= 1
    end
  end
end

triangle(10)
triangle(10, "bottom left")
triangle(10, "top right")
triangle(10, "top right")
