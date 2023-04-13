=begin

input: floating point number
output: string that represents the angle in degrees, minutes, and seconds
rules:
  explicit:
    - degrees can be up to 360
    - degrees have 60 minutes
    - minutes have 60 seconds
    - ° represents degrees, ' represents minutes, " represents seconds
    - use 2 digit numbers with leading zeros when formatting minutes and seconds
  implicit:
    - 0 should return 0°00'00"
    - 360 can either return 360° or 0°
algorithm:
  - define a method `dms(float)` where `float` is a float or integer
  - initialize variables `degrees` and `minutes` == `float`.divmod(1)
  - reassign `minutes` to `minutes` * 60 to get the proper minutes relative to the angle
  - initialize variable `seconds` == `minutes` % 1 * 60 rounded to a whole number
  - make an `if` conditional, assigning `seconds` to 0 and adding 1 to `minutes` if `seconds` == 60
  - make an `if` conditional, assigning `minutes` to 0 and adding 1 to `degrees` if `minutes` == 60
  - write a string `angle` that contains the degrees, minutes, and seconds with degrees formatted to at least 1 digit and minutes & seconds to 2 digits

=end

def dms(float)
  # until float >= 0
  #   float += 360
  # end
  # until float <= 360
  #   float -= 360
  # end
  float %= 360
  degrees, minutes = float.divmod(1)
  minutes *= 60
  seconds = (minutes % 1 * 60).round
  minutes = minutes.to_i
  if seconds == 60
    minutes += 1
    seconds = 0
  end
  if minutes == 60
    degrees += 1
    minutes = 0
  end

  angle = format(%(#{degrees}°%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
