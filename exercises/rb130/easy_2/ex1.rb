=begin

PROBLEM
input: 3 integer arguments
  - first - starting value
  - second - ending value
  - third - number to increase block input for each iteration
output: block eturn
rules:
  explicit:
    -iterate over a range of numbers from first argument to last
    - increase iteration b 3rd argument

DATA
range, block

ALGORITHM
- define a method `step(first, last, inc)`
- until `first` > `last`
  - yield `first` into a block
  - increment `first` by `inc`
- return the range created by the arguments

=end

def step(first, last, inc)
  until first > last
    yield(first)
    first += inc
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
