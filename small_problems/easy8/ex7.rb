=begin

input: string
output: new string, all constenants doubled
rules:
  explicit:
    - all constenants doubled
  implicit:
    - empty string returns empty string
algorithm:
  - define a method `double_consonants(string)`
  - create an empty string `new_string`
  - iterate through each character of `string`
    - if the character is a consonant, push it to `new_string` times 2
    - otherwise push it to `new_string`

=end

def double_consonants(string)
  new_string = ''

  string.each_char do |char|
    if char =~ /[a-zA-Z&&[^aeiouAEIOU]]/
      new_string << char * 2
    else
      new_string << char
    end
  end

  new_string
end

p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
