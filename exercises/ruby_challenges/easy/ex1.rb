=begin

PROBLEM

Write a program to determine whether a triangle is equilateral, isosceles, or scalene

input: 3 numbers
output: string describing type of triangle (equilateral, isosceles, scalene)
rules
  explicit:
    - 3 numbers as input arguments
    - string describing type of triangle as output
    - all lengths must be > 0
    - sum of any 2 sides must be greater than 3rd side
  implicit:
    - inputs can be floats

DATA
arrays

ALGORITHM
- define a class `Triangle`
  - define an `initialize` method
    - initialize a `@sides` variable equal to an array with the 3 input numbers
  - create a getter method for `@sides`
  - define an instance method `kind`
    - test if the triangle is a valid triangle
      - raise error if
        - all 3 sides are not greater than 0
        - each combination of 2 sides is not greater than the 3rd side
    - return `equilateral` if all 3 sides are equal
    - return `isosceles` if 2 of the sides are equal
    - return `scalene` if none of the sides are queal

=end

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise(ArgumentError) if invalid?
  end

  def invalid?
    return true unless sides.all? { |side| side > 0 }
    return true unless sides[0] + sides[1] > sides[2]
    false
  end

  def kind
    if sides[0] == sides[1] && sides[1] == sides[2]
      return 'equilateral'
    elsif sides[0] == sides[1] || sides[1] == sides[2] || sides[2] == sides[0]
      return 'isosceles'
    else
      return 'scalene'
    end
  end
end
