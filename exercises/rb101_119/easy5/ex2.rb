=begin

input: integer
output string
rules:
  Explicit Requirements:
    - The integer must be converted to a sting in 24 hour format (hh:mm)
    - A positive number counts up from 00:00, a negative number counts backwards
    - Any integer should work
  Implicit Requirements:
    - If the integer passed into the method is greater than positive/negative 1439 it will loop past 00:00
    - If the hours or minutes are in the single digits they need a '0' before them (both need to be double digit)

Algorithm:
  - Initialize a method called `time_of_day(minutes)` where `minutes` is a paramater for an integer
  - reassign the integer `minutes` to `minutes % 1440` to bring the integer within the 24 hour minutes mark
  - initialize an array called `hours_minutes` that is equal to `minutes.divmod(60)`
  - Initialize a string called `hours_string` that is equal to format('%02d', hours_minutes[0])`
  - Initialize a string called `minutes_string` that is equal to format('%02d', hours_minutes[1])` 
  - initialize a variable called `time` equal to "#{hours_string}:#{minutes_string}"

=end

def time_of_day(minutes)
  minutes = minutes % 1440
  hours_minutes = minutes.divmod(60)
  hours_string = format('%02d', hours_minutes[0])
  minutes_string = format('%02d', hours_minutes[1])
  time = "#{hours_string}:#{minutes_string}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
