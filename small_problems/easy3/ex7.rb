def palindrome?(input)
  input == input.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

arr = [1,1,1]
arr2 = [1,2,3]
p palindrome?(arr) == true
p palindrome?(arr2) == false
