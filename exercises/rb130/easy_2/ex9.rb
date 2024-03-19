=begin

PROBLEM
input: array
output: nil
rules
  explicit:
    - method takes an aray argument & implicit block
    - yield elements from the array into the block 2 at a time
    - return nil

DATA
array

ALGORITHM
- define a method `each_cons(array)`
- iterate through the array with index
  - yield the current index & the next index to the implicit block
-return nil

=end

def each_cons(array)
  array.each_with_index do |ele, ind|
    yield(ele, array[ind + 1]) unless ind == array.size - 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
