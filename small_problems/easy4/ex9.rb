STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  string = ''
  loop do
    num, digit = num.divmod(10)
    string.prepend(STRINGS[digit])
    break if num == 0
  end
  string
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'
