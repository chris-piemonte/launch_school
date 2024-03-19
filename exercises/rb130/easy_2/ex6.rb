=begin

PROBLEM
input: array
output: same array
rules:
  explicit:
    - method should work like each_with_index
    - method shcould return argument array

ALGORITHM
- set a counter to 0
- iterate through the input array
  - yield the array element and counter to a block
  - increment the counter by 1
- return the input array

=end

def each_with_index(array)
  ind = 0
  
  array.each do |ele|
    yield(ele, ind)
    ind += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
