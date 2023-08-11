=begin
input: 3 integers
output: symbols (:acute, :right, :obtuse, :invalid)
rules
  explicit:
    - right triancgle - one angle is 90 degrees
    - acute riangle - all 3 angles less than 90 degrees
    - obtuse triangle - one angle is greater than 90 degrees
    - all angles must add up to 180 degrees and be greter than 0
    - all arguments will be integer valued angles
    - arguments are specified in degrees
algorithm:
  - define a method `triangle(one, two, three)`
  - define a variable `angles` equal to the three arguments, sorted smallest to largest
  - create a `case` statement
    - when any angle is less than 1, or the sum of angles != 180
      - :invalid
    - when `angles` includes 90
      - :right
    - when `angles` all are less than 90
      - :acute
    - else
      - :obtuse

=end

def triangle(one, two, three)
  angles = [one, two, three]

  case
  when angles.any? { |angle| angle < 1 } || angles.reduce(:+) != 180
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
