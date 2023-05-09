=begin

input: 3 integers as separate arguments
output: string letter grade
rules:
  explicit:
    - 3 arguments, all integers between 0 & 100
    - return regular American letter grades
  implicit:
    - no + or - grades
algorithm:
  - define a method `get_grades(one, two, three)`
  - create a variable `average` == the sum of the integers divided by 3
  - start a case statement
    - when average is between 90 & 100, return A
    - when average is between 80 & 89, return A
    - when average is between 70 & 79, return A
    - when average is between 60 & 69, return A
    - else return F

=end

def get_grade(one, two, three)
  average = (one + two + three) / 3

  case average
  when 90.. then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(150, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"
