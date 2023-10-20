=begin

PROBLEM
Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol
:right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

input: 3 integer arguments
output: symbol stating type of triangle, including invalid
rules:
  explicit:
    - all angles add to 180
    - right has an angle 90
    - acute all 3 angles are less than 90
    - obtuse one angle is greater than 90
    - all arguments will be integers representing degrees
  implicit:
    - no angle can be less than 1
    - all angles will be positive

DATA
case statement and possibly array for the angles

ALGORITHM
- define a method `triangle(a, b, c)`
- make a case statement
  - when a, b, and c don't add up to 180 or any of them are less tahn 1, return :invalid
  - when a, b, or c is 90, return :right
  - when a, b, and c are all less than 90, return :acute
  - when any of a, b, and c are greater than 90, return :obtuse

=end

def triangle(a, b, c)
  array = [a, b, c]

  case
  when array.sum != 180 || array.any? { |angle| angle < 1 }
    :invalid
  when array.any? { |angle| angle == 90 }
    :right
  when array.all? { |angle| angle < 90 }
    :acute
  when array.any? { |angle| angle > 90 }
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
