daylight = [true, false].sample

def time_of_day(x)
  case
    when true then puts "It's daytime!"
    when false then puts "It's nighttime!"
  end
end

time_of_day(daylight)