=begin

input: string
outpus: hash with percentages as values
rules:
  explicit:
    - return hash will have 3 keys, lowercase uppercase and neither
    - the values will be the percentage of the string each key reprersents
    - each input will always contain at least one character
  implicit:
    - spaces and numbers count as neither
algorithm:
  - define a method `letter_percentages(string)`
  - create an empty hash `percentages`
  - create a variable `string_length` equal to the length of the string
  - add the key `:lowercase` to the hash with the value of the lowercase characters divided by `string_length`
  - add the key `:uppercase` to the hash with the value of the uppercase characters divided by `string_length`
  - add the key `:neither` to the hash with the value of the non-alphabetic characters divided by `string_length`
  - return the hash `percentages`

=end

def letter_percentages(string)
  percentages = {}
  string_length = string.length.to_f

  percentages[:lowercase] = ((string.count('a-z') / string_length) * 100).round(1)
  percentages[:uppercase] = ((string.count('A-Z') / string_length) * 100).round(1)
  percentages[:neither] = ((string.count('^a-zA-Z') / string_length) * 100).round(1)
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
