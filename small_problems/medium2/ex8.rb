=begin

input: integer
output: integer, next featured number
rules
  explicit:
    - unique number is odd, multiple of 7, all unique digits
    - return the next featured number
    - return an error message if there is no next featured number
  implicit:
    - 0 is not a featured number
    - argument does not have to bea a featured number itself
algorithm:
  - define a method `featured(num)`
  - create a variable called `multiple` equal to (`num` / 7) + 1
  - create a variable called `annswer` equal to 0
  - loop do
      - answer = `multiple` * 7
      - break if answer is odd && answer's length == answer.to_s.chars.uniq.length
      - multiple += 1
      -end
  - return answer

=end

def featured(num)
  return 'There is no number that fulfills the requirements' if num > 9_876_543_210
  multiple = (num / 7) + 1
  answer = 0

  loop do
    answer = multiple * 7
    break if answer.odd? && answer.to_s.length == answer.to_s.chars.uniq.length
    multiple += 1
  end
  answer
end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
