=begin

input: 2 integer arguments, a count and a multiple
output: array of integers, multiples of the multiple, count number of times
rules:
  explicit:
    - the first argument is the `count`, the number of elemetns in the array
    - the second number is the `multiple`, the elements in the array will be multiples of this number
    - `count` argument wil always be 0 or greater
    - `multiple` can be any value
    - if `count` is 0, an empty array should be returned
algorithm:
  - define a method `sequence(count, multiple)`
  - create an empty array called `array`
  - create a loop, looping `count` number of times
    - push `multiple` * (loop index + 1) to `aray`
  - return `array`

=end

# def sequence(count, multiple)
#   array = []
#   count.times { |ind| array << multiple * (ind + 1) }
#   array
# end

def sequence(count, multiple)
  (1..count).map { |num| num * multiple }
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) #== []
