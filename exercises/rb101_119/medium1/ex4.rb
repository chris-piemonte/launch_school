=begin

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Problem:
input: integer
output: array of integers representing "on" switches
rules:
  explicit:
    - every light is numbered 1 through n (input integer)
    - thre are n number of lights and n iterations (1 argument)
    - each iteration will switch the lights that equal 1 * 1 until >= n
      - then 2 * 2, 3 * 3, etc.
    - all lights start as "off"
    - return an array containing all "on" lights after nth iteration
  implicit:
    - all arguments will be integers, not floats
    - all arguments will by grater than 0

Examples:
input = 5, [1, 4]
input = 10, [1, 4, 9]

Data:
working with arrays or hashes

Algorithm:
  - define a method `lights(n)` 
  - initialize an empty hash called `switches`
  - create a loop n times from 1 - n
    - create a k/v pair in the hash using the current iteration number as teh key and false as the value
  - create a loop n times
    - iterte over the hash `switches`
      - if the key % n == 0, switch the value to the other option (true of false)
  - create an array by iterating over the `switches` has and sleecting the keys with values == true

=end

def initialize_hash(n)
  switches = {}
  1.upto(n) do |n|
    switches[n] = false
  end
  switches
end

def toggle_lights(switches, n)
  1.upto(n) do |n|
    switches.each do |k, v|
      switches[k] = !v if k % n == 0
    end
  end
end

def on_lights_array(switches)
  switches  = switches.select { |k, v| v == true }
  array = switches.keys
end

def lights(n)
  switches = initialize_hash(n)
  toggle_lights(switches, n)
  on_lights_array(switches)
end

p lights(5)
p lights(10)
