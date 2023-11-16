=begin

PROBLEM
input: string
output: integer
rules:
  explicit:
    - input string will contain both integers and 'stack' language
    - register will be initialized as 0
    - all operations are integer operations
    - all programs are correct programs
  implicit:
    - stack program will not pring anything if 'PRINT' is not included in the string

DATA
array for the stack, variable set to 0 for the register

ALGORITHM
- define a method `minilang(string)
- initialize an empty array `stack`
- initialize an array `commands` with the different words of the input string as their element
- initialize a variable `register` = 0
- create a loop `commands` length times
  - crate a case statement with the last element of the array as the argument, removed from the array
    - when 'PUSH' add the `register` value to the `stack` array
    - when 'ADD' pop the last value from the stack and add it to `register`
    - when `SUB` pop the last value from the stack and subtracct it from `register`
    - when 'MULT' pop the last value from the stack and multiply it with the `register`
    - when 'DIV' pop the last value from the stack and divide it into the `register`
    - when 'MOD' pop the last value from the stack and modulo it into the `register`
    - when 'POP' Remove the topmost item from the stack and place in register
    - when 'PRINT' print the register value
    - otherwise rassign the register to the value converted into an integer

=end

def minilang(string)
  commands = string.split
  stack = []
  register = 0

  commands.each do |ele|
    case ele
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = ele.to_i
    end
  end
end

minilang('6 PUSH')
