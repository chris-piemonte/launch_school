def center_of(string)
  size = string.size

  if size.remainder(2) != 0
    puts string[size / 2]
  else
    puts string[(size / 2) - 1, 2]
  end
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
