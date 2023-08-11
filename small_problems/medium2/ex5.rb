=begin

input: 3 integers
output: symbol
rules:
  explicit:
    - to be a triangle, the lengths of the 2 shortest sides must be greater than the length of the longest side
    - to be valid, all sides must hafve lengths greater than 0
    - if either of the above conditions is not satisfied, return `:invalid`
    - `:equilateral` - all 3 sides are equal length
    - `:isosceles` - 2 sides are equal lengthm 3rd is different
    - `:scalene` - all 3 sides are different length
  implicit:
    - floats are allowed
algorithm:
  - define a method `triangle(side_one, side_two, side_three)`
  - return `:invalid` if the sum of all the sides minus the longest side < longest side
  - return `:equilateral` if all three sides are equal
  - return `:scaline` if all three sides are different
  - else return `isosceles`
=end

def triangle(side_one, side_two, side_three)
  sides = [side_one, side_two, side_three].sort
  return :invalid if sides[0] + sides[1] <= sides[2]
  return :equilateral if sides[0] == sides[1] && sides[1] == sides[2]
  return :scalene if sides[0] != sides[1] && sides[1] != sides[2] && sides[2] != sides[1]
  :isosceles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
