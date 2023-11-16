class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :year, :model, :color

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    "My car is a #{color} #{year} #{model}."
  end
end

class MyTruck < MyCar
include Towable

  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color} #{year} #{model}."
  end
end

my_car = MyCar.new('2010', 'Ford Taurus', 'green')
my_car2 = MyCar.new('2011', 'Toyota Camry', 'red')
my_truck = MyTruck.new('2015', 'Ford F150', 'blue')

puts my_car
puts my_truck

puts Vehicle.number_of_vehicles
