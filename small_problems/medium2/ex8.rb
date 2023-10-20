=begin

input: integer
output: next higherst integer that is featured
        - odd number, multiple of 7, digits only occur once
rules:
  explicit:
  - featured number is off, multiple of 7, digits occurs once
  - return an error message if no next featured number
  implicit:
    - can't have more than 10 digits
    - all numbers are integers not floats

DATA
array to store and compare the digits

ALGORITHM
- define a method `featured(n)
- start a loop from n + 1 to 9999999999
  - if num is odd and a multiple of 7
    - convert num to an array of string digits
    - if all elements of the array are unique (array is equal to itself with non-unique values removed)
      - return num
  - return 'There is no possible number that fulfills those requirements' if return condition not met

=end

def featured(n)
  (n+1).upto(9999999999) do |num|
    if num.odd? && num % 7 == 0
      array = num.to_s.chars
      return num if array == array.uniq
    end
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
