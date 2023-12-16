module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts 
puts HotSauce.ancestors

=begin

How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

  You follow the chain of class/module inheritance, and can call the Object.ancestors method.

What is the lookup chain for Orange and HotSauce?

  Orange: Orange, Taste, Object, Kernel, BasicObject
  HotSauce: HotSauce, Taste, Object, Kernel, BasicObject

=end
