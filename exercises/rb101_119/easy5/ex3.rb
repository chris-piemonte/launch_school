=begin

After Midnight
Input: string in 24 hr format '00:00'
Output: integer
Rules:
  Explicit Requirements:
    - The string in 24 hr format must be converted to an integer
    - The integer should be between 0 & 1439
    - The integer should count forwards from 0
  Implicit Requirements:
    - The argument '24:00' passed to the method should return 0

Algorithm:
  - initilize method definition `after_midnight(time_string)` where `time_string` is a parameter for the time as a string in 24 hr format
  - initialize a variable `hours` equal to `time_string[0, 2].to_i`
  - initialize a variable `minutes` equal to `time_string[3, 2].to_i`
  - intitialze a variable `total_minutes` equal to `(hours * 60) + minutes`
  - start an `if` conditional
   - if `total_minutes == 1440` return 0
   - else return total_minutes

Before Midnight
Input: string in 24 hr format '00:00'
Output: integer
Rules:
  Explicit Requirements:
    - The string in 24 hr format must be converted to an integer
    - The integer should be between 0 & 1439
    - The integer should count backwards from 1440
  Implicit Requirements:
    - The argument '24:00' passed to the method should return 0

Algorithm:
  - initialize a method defintion 1before_midnight`(time_string)` where `time string` is a parameter for the time as a string in 24 hr format
  - initialize a variable `hours` equal to `time_string[0, 2].to_i`
  - initialize a variable `minutes` equal to `time_string[3, 2].to_i`
  - intitialze a variable `total_minutes` equal to `(hours * 60) + minutes`
  - start an `if` conditional
   - if `total_minutes == 1440 or if total_minutes == 0` return 0
   - else return `1400 - total_minutes`

=end

def after_midnight(time_string)
  hours, minutes = time_string.split(':').map(&:to_i)
  (hours * 60 + minutes) % 1440
end

def before_midnight(time_string)
  total_minutes = 1440 - after_midnight(time_string)
  total_minutes = 0 if total_minutes == 1440
  total_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

