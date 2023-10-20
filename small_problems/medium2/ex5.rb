=begin

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

PROBLEM
input: 3 integers, representing 3 sides of triangle
output: type of triangle
rules:
  explicit:
    - equilateral All 3 sides are of equal length
    - isosceles 2 sides are of equal length, while the 3rd is different
    - scalene All 3 sides are of different length
    - if the 2 shorter sides summed are less than the longest side, return invalid

ALGORITHM
  - define a method `triangle(a, b, c)`
  - create an array using a b & c as the elements and sort it lowest to highest
  - if a + b < c, return :invalid
  - if a == b == c return :equilaretal
  - if a == b != c or a == c != b or a == c != b return :isolsceles
  - if a != b != c return :scaline

=end

def triangle(a, b, c)
  array = [a, b, c].sort
  return :invalid if array[0] + array[1] <= array[2]
  return :equilateral if a == b && b == c
  return :isosceles if a == b || a == c || b == c
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
