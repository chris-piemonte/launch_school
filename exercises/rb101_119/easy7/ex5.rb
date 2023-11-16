=begin
input: string
output: new string, caps staggered
rules:
  explicit:
    - every other character caputalized
    - characters that are not letters should be unchanged, but count as characters when switching b/w uppercase and lowercase
  implicit:
    - first character always capitalized
algorithm:
  - define a method staggered_case(string)
  - create an array `staggered` and set it to iterate through each character of string tranformatively with index
    - if `index` is even, capitalize the character
    - if the `index` is odd, lowercase the character
    - otherwise return the character
  - combine the characters of `staggered` into an array

=end

def staggered_case(string, start_upcase = true)
  staggered = string.chars.each_with_index.map do |char, index|
    if index.even?
      char.upcase
    elsif index.odd?
      char.downcase
    else
      char
    end
  end

  return staggered.join.swapcase! if start_upcase == false
  staggered.join
end

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', false) #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', false) #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false) #== 'IgNoRe 77 ThE 444 NuMbErS'
