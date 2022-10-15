# What will the following code print? Why?

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

=begin
It will print 0 1 2 3 4 10 for the same reason as ex7 but this time the last line exeecuted is the integer
10 so that iswhat puts count_sheep will return instead of the return value of 5.times which is 5.
=end