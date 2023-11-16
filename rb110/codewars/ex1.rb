=begin


# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

PROBLEM
input: array of numbers
output: array of how many numbers in input array were smaller than the number at this index
  rules:
    explicit:
      - only unique values should be counted (don't count duplicate smaller numbers more tahn once)
    implicit:
      - output array willl be same size as input array

Data
arrays

ALGORITHM
  - define a method `smaller_numbers_than_current(array)`

  - create a second array of unique numbers in the input array

  - create an empty return array
  - create a counter
  - add the count of smaller numbers in the input array into the return array
    - iterate over the input array
      - add the number of elements in unique array smaller than current element to return array
        - iterate over the unique array
        - if the unique array number is less than the input array number increment counter by 1
      - add the counter number to the return array
      - reset counter to 0

- return the return array

=end

# def smaller_numbers_than_current(array)
#   unique = array.uniq

#   answer = []
#   counter = 0
#   array.each do |input_num|
#     unique.each do |unique_num|
#       counter += 1 if unique_num < input_num
#     end
#     answer << counter
#     counter = 0
#   end

#   answer
# end

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

def smaller_numbers_than_current(array)
  unique = array.uniq

  answer = []
  array.each do |input_num|
    answer << unique.count { |ele| ele < input_num }
  end

  answer
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
