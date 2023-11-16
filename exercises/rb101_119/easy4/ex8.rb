CONVERSION = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def string_to_integer(string)
  arr = string.chars.map { |digit| CONVERSION[digit] }
  
  answer = 0
  arr.each do |x|
    answer *= 10
    answer += x
  end
  answer
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else string_to_integer(string)
  end
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100

# def string_to_signed_integer(string)
#   string_no_sign = string.delete('+-')
#   answer = string_to_integer(string_no_sign)

#   answer *= -1 if string.start_with?('-')
#   answer
# end
