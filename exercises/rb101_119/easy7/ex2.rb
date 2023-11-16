=begin

input: string
output: hash with 3 key/value pairs
rules:
  explicit:
    - first key/value pair, number of characters in string that are lowercase letters
    - second key/value pair, number of characters in string that are uppercase letters
    - second key/value pair, number of characters that are neither
  implicit:
    - empty strings are permitted
algorithm:
  - define a method `letter_case_count(string)`
  - reassign `string` to an array of the characters in `string`
  - create an empty hash `hash`
  - set `hash` key `lowercase:` to the number of lowercase characters in `string`
  - set `hash` key `uppercase:` to the number of uppercase characters in `string`
  - set `hash key `neither:` to the `string` size - the `lowercase` and `uppercase` values of `string`

=end

def letter_case_count(string)
  hash = {}

  hash[:lowercase] = string.count('a-z')
  hash[:uppercase] = string.count('A-Z')
  hash[:neither] = string.size - hash.values.sum
  hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
