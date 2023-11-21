module Actions
  def walk
    puts "#{@name} #{gait} forward"
  end
end

class Person
  attr_reader :name
  include Actions

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Actions

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Actions

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title
  include Actions

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end

  def walk
    puts "#{title} #{name} #{gait} forward"
  end
end

mike = Person.new("Mike")
mike.walk

kitty = Cat.new("Kitty")
kitty.walk

flash = Cheetah.new("Flash")
flash.walk

byron = Noble.new("Byron", "Lord")
byron.walk

puts byron.name
puts byron.title
