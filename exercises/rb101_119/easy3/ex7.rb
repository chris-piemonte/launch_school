def palindrome?(arg)
  arg == arg.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([3,5,6,6,5,3]) == true
p palindrome?([3,5,6,6,5,4]) == false
