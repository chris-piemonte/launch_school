=begin

input: string
output: new string
rules:
  explicit:
    - all lower and upper case letters changed to opposite
    - all other characters remain unchanged
    - cannot use swapcase
algorithm:
  - define a method `swapcase(string)`
  - create an empty array `swapped`
  - iterate through each charatcer of `string` in an array
  - create an `if` conditional
    - if the letter is lowercase, make it uppercase and push to `swapped`
    - if the letter is uppercase, make it lowercase and push to `swapped`
    - else  push to `swapped`
=end

def swapcase(string)
  swapped = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end

  swapped.join
end

# def swapcase(string)
#   string.split.map(&:swapcase).join(' ')
# end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'
