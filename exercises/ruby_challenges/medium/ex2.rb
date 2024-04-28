=begin

PROBLEM
Write a class that makes instances of a robot object and can randmoize its name

rules:
    - `Robot` class
      - `name` insstance method
      - `reset` instance method
      - `name` == /^[A-Z]{2}\d{3}$/
      - `reset` generates new name

DATA
- `Robot` class
  - constructor method
    - `name` instance method
  - `name` getter method
  - `reset` instance method

ALGORITHM
- define a class `Robot`
  - define a constructor method
    - create `@name` instance variable
    - create `@old_name` instance variable
  - define an instance method `name`
    - randomize `name` instance variable in accordance with /^[A-Z]{2}\d{3}$/
  - define an instance method `reset`
    - assign `old_name` to the same string as `name`
    - reassign `name` to an empty string

=end

class Robot
  attr_reader :name

  def initialize
    @name = ''
    reset
  end

  def reset
    @@taken_names.delete(name)
    generate_name
    @@taken_names << name
  end

  private

  @@taken_names = []

  def generate_name
    loop do
      @name = ''
      2.times { name << ('A'..'Z').to_a.sample }
      3.times { name << rand(9).to_s }
      break unless @@taken_names.include? name
    end
  end
end
