# def missing(array)
#   array.sort!
#   new_array = []

#   array.first.upto(array.last) do |num|
#     new_array << num unless array.include?(num)
#   end
#   new_array
# end

def missing(array)
  (array.min..array.max).to_a - array
end

require 'pry'

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     binding.pry
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
