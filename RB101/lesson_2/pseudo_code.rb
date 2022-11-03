=begin
a method that returns the sum of two integers

Ask the user for input
save the inputs into 2 variables
add the 2 variables together to be the answer
display the answer
..............................................
START

PRINT Let's add two numbers together, what's your first number?
SET variable1 = GET integer
PRINT what's your second number?
SET variable2 = GET integer

SET answer = variable1 + variable2
PRINT answer

END
=end
#__________________________________________________________________
=begin
a method that takes an array of strings, and returns a string that is all those strings concatenated together

Given an array of strings

Iterate over the array one by one
 -

=end

array = ["this", "is", "the", "sentence"]
variable = array.to_s
p variable