=begin

input: string
output: string, alternating letters capitalized & lowercase
rules:
  explicit:
    - alternating capital and lowercase letters, starting with uppercase
    - non-alphabetic characterrs don't count in alternation
algorithm:
  - define a method `staggered_case(string)`
  - create a variable `result` as an empty string
  - create a variable `capital?` and assign it to `true`
  - iterate through each string character
    - create an if conditional
      - if `capital?` is set to true
        - upcase the character and add it to the `result` string
        - make `capital?` false
      - if `capital?` is false
        - downcase the character and add it to the `result` string
        - make `capital?` true
      - otherwise, add the character to the `result` string


=end
require 'pry'
def staggered_case(string, include_non_alphabet = false)
  result = ''
  capital = true

  string.each_char do |char|
    if char =~ /[^a-zA-Z]/
      result << char
      capital = !capital if include_non_alphabet == true
    elsif capital == true
      result << char.upcase
      capital = false
    elsif capital == false
      result << char.downcase
      capital = true
    end
  end

  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('this is example', true)
