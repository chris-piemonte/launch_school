=begin

input: string
output: new string, words >= 5 charactes reversed
rules:
  explicit:
    - words that contain at least 5 characters reversed
    - strings consist of only letters and spaces
    - spaces only included when more than one word present
algorithm:
  - definte a mthod `reverse_words(string)`
  - split the `string` argument into an array called `split_string`
  - iterate through `split_string` transformatively
    - if the size of the element is >= 5, reverse it
  - join `split_string` back into a string seperated by spaces

=end

def reverse_words(string)
  split_string = string.split
  
  split_string.map! do |word| 
    if word.size >= 5
      word.reverse
    else
      word
    end
  end
  
  split_string.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
