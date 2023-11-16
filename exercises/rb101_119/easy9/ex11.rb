=begin

input: array
output: array of every other element
rules:
  explicit:
    - every other element
    - start with the first element
  implicit:
    - if only one lement, return an array of that element
    - if no elements return an empty array
algorithm:
  - define a method `oddities(array)`
  - iterate over `array` with index, and `select`
    - if index is even, true

=end

# def oddities(array)
#   answer = []
#   array.each_with_index { |ele, ind| answer << ele if ind.even? }
#   answer
# end

# def oddities(array)
#   answer = []
#   index = 0

#   while index < array.size
#     answer << array[index]
#     index += 2
#   end

#   answer
# end

def oddities(array)
  answer = []
  ind = 0

  array.size.times do
    answer << array[ind] if ind.even?
    ind += 1
  end

  answer
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) #== [1, 3, 5]
p oddities(['abc', 'def']) #== ['abc']
p oddities([123]) #== [123]
p oddities([]) #== []
p oddities([1, 2, 3, 4, 1]) #== [1, 3, 1]
