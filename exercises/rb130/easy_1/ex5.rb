=begin

The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field. The
names are in an encrypted form, though, using a simple (and incredibly weak)
form of encryption called Rot13. Write a program that deciphers and prints
each of these names.

PROBLEM
input: string
output: new string
rules:
  explicit:
    - Input a string encrypted using Rot13
    - Output the decoded string
    - print the deecoded string to the display

DATA
hash to store the cypher > keys for the letters, values for the numbers, or vice-versa

Algorithm
- define a method `decription(string)`
- crete a hash 26 k/v pairs long
  - keys are letters, values are letters they should change into
    - k + 13 == value
    - use an array of all letters and their indexes to create the hash
  - iterate transformatively through string
    - return the value of the current character passed as a key to the hash
  - return transformed string
=end

def decription(string)
  cypher = {}
  array = ('a'..'z').to_a
  uppercase_array = array.map(&:upcase)

  array.each_with_index do |letter, ind|
    new_ind = ind + 13
    new_ind -= 26 if new_ind > 25
    cypher[letter] = array[new_ind]
  end

  new_string = string.split('').map do |char|
    if array.include?(char)
      cypher[char]
    elsif uppercase_array.include?(char)
      cypher[char.downcase].upcase
    else
      char
    end
  end

  new_string.join
end

def decription(string)
  new_string = string.chars.map do |char|
    case char
    when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
    else char
    end
  end
  new_string.join
end

p decription('Nqn Ybirynpr')
p decription('Tenpr Ubccre')
p decription('Nqryr Tbyqfgvar')
p decription('Nyna Ghevat')
p decription('Puneyrf Onoontr')
p decription('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decription('Wbua Ngnanfbss')
p decription('Ybvf Unvog')
p decription('Pynhqr Funaaba')
p decription('Fgrir Wbof')
p decription('Ovyy Tngrf')
p decription('Gvz Orearef-Yrr')
p decription('Fgrir Jbmavnx')
p decription('Xbaenq Mhfr')
p decription('Fve Nagbal Ubner')
p decription('Zneiva Zvafxl')
p decription('Lhxvuveb Zngfhzbgb')
p decription('Unllvz Fybavzfxv')
p decription('Tregehqr Oynapu')
