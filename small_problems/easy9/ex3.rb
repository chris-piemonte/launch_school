=begin

input: integer
output: array of integers
rules:
  explicit:
    - return array of all integers between 1 and argument integer
    - argument will always be valid inteder greater than 0
  implicit:
    - argument of 1 returns an array of itself
algorithm
  - definte a method `sequence(num)`
  - create an empty array called `array`
  - create a loop using `num` and the `#times` method
    - push the current loop number to `array`
  - return `array`

=end

# def sequence(num)
#   array = []
#   num.times { |ind| array << ind + 1 }
#   array
# end

def sequence(num)
  if num > 0
    (1..num).to_a 
  elsif num <= 0
    (num..num.abs).to_a
  end
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]
p sequence(-5)
