=begin

Input: string, all lowercase
Output: string
Explicit Rules:
  - all non-alphabetic characters replaced by spaces
  - only one space in a row
Implicit Rules:
  - non-alphabetic characters at beginning or end of string leads to space at beginning or end of string
Algorithm:
  - define method `cleanup(string)` where the parameter is for an all lowercase string
  - initialize an array `letters` equal to all lowercase letters a - z
  - initialize an array `characters` equal to String#chars called on `string`
  - call the Array#map! method on `characters` to iterate through each character
    - if `letters.include?` does not include the character, assign it to ' '
    - end the #map method
  - call Array#join on `characters` to put the string back together

=end

# def cleanup(string)
#   letters = ('a'..'z').to_a
#   characters = string.chars

#   characters.map! do |char|
#     letters.include?(char) ? char : ' '
#   end
  
#   characters.join.squeeze(' ')
# end

# def cleanup(string)
#   new_string = []
#   letters = ('a'..'z').to_a
#   characters = string.chars

#   characters.each do |char|
#     if letters.include?(char)
#       new_string << char
#     else
#       new_string << ' ' unless new_string.last == ' '
#     end
#   end
  
#   new_string.join
# end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") #== ' what s my line '
