def palindrome?(arg)
  arg == arg.reverse
end

def real_palindrome?(string)
  new_string = string.downcase.delete('^a-z0-9')
  palindrome?(new_string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
