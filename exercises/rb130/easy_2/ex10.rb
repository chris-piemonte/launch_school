=begin

PROBLEM
input: array
output: nil
rules
  explicit:
    - method takes an aray argument, 'n' argument & implicit block
    - yield elements from the array into the block an arbitrary amout of times
      - determine with a 2nd argument 'n'
    - return nil

DATA
array

ALGORITHM
- define a method `each_cons(array, n)`
- iterate through the array with index
  - unless (ind + n) > array.size - 1
  - yield the current index through 'n - 1'  index to the implicit block
-return nil

=end

def each_cons(array, n)
  array.each_with_index do |ele, ind|
    # binding.pry
    yield(*array[ind..(ind + n - 1)]) unless (ind + n - 1) >= (array.size)
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
