class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

# running kitty.class.generic_greeting would print "Hello! I'm a cat!" because kitty.class returns the class `Cat` which
# has the method `generic_greeting` defined for it
