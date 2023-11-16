class Cat
  @@sum = 0

  def initialize
    @@sum += 1
  end

  def self.total
    puts @@sum
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
