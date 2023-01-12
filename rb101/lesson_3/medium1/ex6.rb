answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
p new_answer

# The answer will be 34 because the def is passing its sum onto a new variable
