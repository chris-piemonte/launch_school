=begin

input: odd integer `n`
output:  n * n grid of a diamond using `*`
rules:
  explicit:
    - integer will always be odd
    - must make a diamond out of `*` symbols
  implicit:
    - input of 1 equals a single *
    - the integer always represents the number of `*` in the center row
    - the ends always have 1 `*` and each row closer to the middle adds 2
algoorithm:
  - define a method `diamond(n)`
  - set a `stars_counter` variable equal to 1
  - create a variable `number_of_spaces` equal to n / 2
  - create a loop that runs ((n/2) + 1) times
    - puts (' ' times number_of_spaces) + (* times `stars_counter`)
    - `stars_counter` += 2
    - `number_of_spaces` -= 1
    - end loop
  - set `stars_counter` to n - 2
  - set `number_of_spaces` to 1
  - create a second loop that runs n/2 times
    - puts (' ' times number_of_spaces) + (* times `stars_counter`)
    - `stars_counter` -= 2
    - `number_of_spaces` += 1
    -end loop

=end

# def diamond(n)
#   stars_counter = 1
#   number_of_spaces = n / 2
#   ((n/2) +1).times do
#     puts((' ' * number_of_spaces) + ('*' * stars_counter))
#     stars_counter += 2
#     number_of_spaces -= 1
#   end

#   stars_counter = n - 2
#   number_of_spaces = 1
#   (n/2).times do
#     puts((' ' * number_of_spaces) + ('*' * stars_counter))
#     stars_counter -= 2
#     number_of_spaces += 1
#   end
# end

# def diamond(n)
#   puts (' ' * (n / 2) + '*')

#   middle_spaces = 1
#   left_spaces = (n / 2) - 1
#   (n/2).times do
#     puts((' ' * left_spaces) + '*' + (' ' * middle_spaces) + '*' )
#     middle_spaces += 2
#     left_spaces -= 1
#   end

#   middle_spaces = n - 4
#   left_spaces = 1
#   ((n/2) - 1).times do
#     puts((' ' * left_spaces) + '*' + (' ' * middle_spaces) + '*' )
#     middle_spaces -= 2
#     left_spaces += 1
#   end

#   puts (' ' * (n / 2) + '*')
# end

def print_row(n, distance_from_center)
  stars = '*' * ( n - (distance_from_center * 2) )
  puts stars.center(n)
end

def diamond(n)
  max_distance = n / 2
  max_distance.downto(0) { |distance| print_row(n, distance) }
  1.upto(max_distance) { |distance| print_row(n, distance) }
end

diamond(9)
diamond(3)
diamond(15)
