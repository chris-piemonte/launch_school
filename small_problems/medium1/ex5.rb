=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is
supplied as an argument to the method. You may assume that the argument will always be an odd integer.

PROBLEM
input: odd integer n
output: 4 pointed diamonf of n height and width
rules:
  implicit:
    - n will always be odd
    - diamond is of n width and height

DATA
string concatenation and/or interpolation

ALGORITHM
- define a method `diamond(n)
- initialize a variable `half` assigned to n / 2
- initialize a variable `spaces` = `half`
- initialize a vairable `stars` = 1
- create a loop `half` + 1 times
  - print spaces `spaces` times and a star `star` times after that
  - reduce `spaces` by 1
  - increase `stars` by 2
- increase `spaces` by 1 and decrease `stars` by 2
- create a loop `half` times
  - print spaces `spaces` times and a star `star` times after that
  - increase `spaces` by 1
  - decrease `stars` by 2

=end

def print_top(n)
  
end

def diamond(n)
  half = n / 2
  spaces = half
  stars = 1

  (half + 1).times do |n|
    puts(' ' * spaces + '*' * stars)
    spaces -= 1
    stars += 2
  end

  spaces += 2
  stars -= 4
  half.times do |n|
    puts (' ' * spaces + '*' * stars)
    spaces += 1
    stars -=2
  end
end

diamond(9)
