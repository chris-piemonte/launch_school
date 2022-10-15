# What will the following code print? Why?

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

=begin
It will print 0 1 2 3 4 5. The 0 - 4 is because it's using integer#times, since #times starts at 0 it will count from 0 - 4. The 5 is because #times 
returns the initial integer which is 5 in this case and the cods has puts count_sheep so it puts the return value of 5 at the end.
=end