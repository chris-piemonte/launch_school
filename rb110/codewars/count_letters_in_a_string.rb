=begin

In this kata, you've to count lowercase letters in a given string and return
the letter count in a hash with 'letter' as key and count as 'value'. The key
must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

PROBLEM
counts lowercase letters in a given string, return letter count in a hash with letter/count being k/v pair
input: string
output: hash
rules:
  explicit:
    - return a hash
    - characters as symbol for keys
    - count of characters for symbol
    - only lowercase letters

DATA
hash

ALGORITHM
- define a method `letterCount(string)`
- put each character of string into a hash as a k, count as its v
  - crate an array of the charactrs of string
  - crete a hash of the charactes using the array of chracters

=end

def letterCount(string)
  array = string.chars.delete_if { |char| /[^a-z]/.match(char) }
  array.map! { |ele| ele.to_sym }
  array.to_h { |ele| [ele, array.count(ele)] }
end

p letterCount('arithmeticsABC123') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
