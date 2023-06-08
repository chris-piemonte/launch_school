=begin

input: string
output: integer
rules:
  explicit:
    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value

    - all programs are correct programs
    - register initialized to 0

  implicit:
    - stack will be an Array
    - will use the #push and #pop methods
    - the string input is the ordered instructions for the stack implementation

algorithm:
  - define a method `minilang(command)`
  - create an empty arrray called `stack`
  - create a variable `register` = 0
  - create an array called `instructions` equal to the words of the `command` input string as elements
  - iterate through the elements of `instructions`
    - start a case statement with `command` as the argument
    - when `n`, `register` = `n`
    - when `PUSH`, push `register` to `stack`
    - when `ADD`, pop the last value from `stack` and add it to the value of `register`
    - when `SUB`, pop the last value from `stack` and subtract it to the value of `register`
    - when `MULT, pop the last value from `stack` and multiply it to the value of `register`
    - when `DIV`, pop the last value from `stack` and divide it into the value of `register`
    - when `MOD`, pop the last value from `stack` and divide it into the value of `register`, storing the integer remainder of the devision in the `register`
    - when `POP`, pop the last value from `stack` and assign it to the value of `register`
    - when `PRINT`, print the value of `register`

=end

require 'pry'
def minilang(command)
  stack = []
  register = 0
  instructions = command.split
  
  instructions.each do |ele|
    # binding.pry
    case
    # when %w(0 1 2 3 4 5 6 7 8 9).include?(ele) == true then register = ele.to_i
    when ele =~ /[0-9]/ then register = ele.to_i
    when ele == 'PUSH' then stack << register
    when ele == 'ADD' then register += stack.pop.to_i
    when ele == 'SUB' then register -= stack.pop.to_i
    when ele == 'MULT' then register *= stack.pop.to_i
    when ele == 'DIV' then register /= stack.pop.to_i
    when ele == 'MOD' then register %= stack.pop.to_i
    when ele == 'POP' then register = stack.pop.to_i
    when ele == 'PRINT' then puts(register)
    else puts 'error'
    end
  end
end

minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH -7 ADD DIV PRINT')

# minilang('PRINT')
# # 0
# minilang('5 PUSH 3 MULT PRINT')
# # # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # # 5
# # # 3
# # # 8
# minilang('5 PUSH POP PRINT')
# # # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # # 5
# # # 10
# # # 4
# # # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # # 12
# minilang('-3 PUSH 5 SUB PRINT')
# # # 8
# minilang('6 PUSH')
# # # (nothing printed; no PRINT commands)
