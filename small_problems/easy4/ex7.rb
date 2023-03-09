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

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570
