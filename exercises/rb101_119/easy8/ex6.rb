=begin

input: string
output: new string
rules:
  explicit:
    - new string
    - every character is doubled
  implicit:
    - empty string returns an empty string
    - spaces and non-alphanumeric characters count
algorithm:
  - define a method `repeater(string)`
  - create an empty string `new_string`
  - iterate through each character of `string`
    - for each element, push the element to `new_string` times 2
  - return `new_string`

=end

def repeater(string)
  new_string = ''

  string.each_char { |char| new_string << char * 2 }

  new_string
end

p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') #== ''
