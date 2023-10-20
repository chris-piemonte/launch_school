=begin

input: string
output: hash with 3 k/v pairs
rules:
  explicit:
    - each string will ahve at least 1 character
    - keys are lowercase, uppercase, and neither
    - values are the % of characters in the string of each catgory
  implicit:
    - spaces count as neither

DATA
hash

ALGORITHM
- define a method `letter_percentages(string)`
- create an empty hash
- assign the key `lowercase:` to the empty hash
  - value is the count of characters that are lowercase as a float / string length as a float * 100
- assign the key `uppercase:` to the empty hash
  - value is the count of characters that are uppercase as a float / string length as a float * 100
- assign the key `neither:` to the empty hash
  - value is the count of characters that are neither as a float / string length as a float * 100
- return the hash

=end

def letter_percentages(string)
  categories = {}
  categories[:lowercase] = string.count('a-z').to_f / string.length.to_f * 100
  categories[:uppercase] = string.count('A-Z').to_f / string.length.to_f * 100
  categories[:neither] = string.count('^a-zA-Z').to_f / string.length.to_f * 100
  categories
end


p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
