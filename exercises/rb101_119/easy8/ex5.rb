=begin
input: 2 arguments, a starting integer and ending integer
output: print all numbers from starting number to ending number, replacing all numbers devisible by 3 with "Fizz", 5 with "Buzz" and both with "FizzBuzz"
rules:
  explicit:
    - print all numbers from 1st argument to 2nd argument
    - replace all numbers devsible by 3 with "Fizz"
    - replace all numbers decisible by 5 with "Buzz"
    - replace all numbers devisible by 3 & 5 with "FizzBuzz"
  implicit:
    - both arguments are integers
algorithm:
  - define a method `fizzbuzz(start, end)`
  - create an array `numbers` equal to all numbers in the range of `start` to `end`
  - iterate through `numbers` transformatively
    - create a case statement
      - when element % 3 == 0 & element % 5 == 0 element == "FizzBuzz"
      - when element % 3 == 0 element == "Fizz"
      - when element % 5 == 0 element == "Buzz"
  - print numbers

=end
def fizzbuzz(first_num, last_num)
  numbers = (first_num..last_num).to_a
  result = []
  
  numbers.each do |ele|
    case
    when ele % 3 == 0 && ele % 5 == 0 then result << "FizzBuzz"
    when ele % 3 == 0 then result << "Fizz"
    when ele % 5 == 0 then result << "Buzz"
    else
      result << ele
    end
  end
  
  print result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
