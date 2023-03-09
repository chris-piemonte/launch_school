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

def signed_integer_to_string(num)
  answer = integer_to_string(num.abs)
  answer.prepend('-') if num < 0
  answer.prepend('+') if num > 0
  answer
end

p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'
