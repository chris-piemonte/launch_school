=begin

PROBLEM
input: array
output: argument object
rules:
  explicit:
    - method should work like each_with_object
    - method shcould return the new argument object
  implicit:
    - argument object needs to be mutated, not reassigned

ALGORITHM
- define a method `each_with_object(array, obj)`
- iterate through array
  - yield the array element and argument object to the block
- return the argument object

=end

def each_with_object(array, obj)
  array.each { |ele| yield(ele, obj) }
  obj
end

  result = each_with_object([1, 3, 5], []) do |value, list|
    list << value**2
  end
  p result == [1, 9, 25]
  
  result = each_with_object([1, 3, 5], []) do |value, list|
    list << (1..value).to_a
  end
  p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
  
  result = each_with_object([1, 3, 5], {}) do |value, hash|
    hash[value] = value**2
  end
  p result == { 1 => 1, 3 => 9, 5 => 25 }
  
  result = each_with_object([], {}) do |value, hash|
    hash[value] = value * 2
  end
  p result == {}
