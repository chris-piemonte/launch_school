# rubocop:disable Layout/LineLength
=begin

PROBLEM
Create a clock that is independent of date. You should be able to add minutes to
and subtract minutes from the time represented by a given Clock object. Note
that you should not mutate Clock objects when adding and subtracting minutes --
create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

input:
  - 1 - 2 arguments, representing hours and minutes
  - 1st necessary, 2nd optional
output:
  - time in string form: 'XX:XX'

rules:
  explicit:
    - 1st argument hours, 2nd minutes, 2nd is optional
    - time in string form: 'XX:XX'
    - no bulit-in time or date methods
    - when adding or subtracting time, create new Clock object
  implicit:
    - military time
    - `+` method adds minutes, `-` method subtracts minutes
    - `self.at` method returns new clock object
      - `to_s` instance method returns time string

DATA
- `Clock` class
  - `at` class method
  - `to_s` instance method
  - `+` & `-` instance methods

ALGORITHM
- define class `Clock`
  - create getter methods for `hours` & `minutes`
  - define a constructor method
    - set instance variable `hours` to first argument, `minutes` to second
  - define class method `at(hours, minutes=0)`
    - create a new `Clock` object
  - define an instance method `to_s`
    - convert `hours` & `minutes` to strings, concatenate with ':' in the middle
      - add 0 in front of hours & minutes if 1 - 9
      - make hours or minutes 00 if == 0
  - define an instance method `+`
    - create a new `Clock` object w/ current `hours` & `minutes` variables as arguments
    - add `+` argument to `minutes`
      - if minutes > 60, divmod by 60 & add quotient to `hours`, assign `minutes` to modulus
        - if `hours` > 24, reassign to result of % 24
  - define an isntance method `-`
    - create a new `Clock` object w/ current `hours` & `minutes` variables as arguments
    - subtract `-` argument to `minutes`
      - if minutes < 0, divmod absolute value by 60 & subtract quotient from `hours`, assign `minutes` to 60 - modulus
        - if `hours` < 0, reassign to result of 24 - absolute value
          - loop this if hours still < 0
  - define an instance method `=`
    - return true if self calling `to_s` == other object calling `to_s`
=end
# rubocop:enable Layout/LineLength

class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  # def to_s
  #   "#{display(hours)}:#{display(minutes)}"
  # end

  # def display(num)
  #   if num < 10
  #     "0#{num}"
  #   else
  #     num.to_s
  #   end
  # end

  def +(min)
    hours = @hours
    minutes = @minutes
    minutes += min

    if minutes > 60
      hours += minutes / 60
      minutes = minutes % 60
    end
    hours = hours % 24 if hours >= 24

    Clock.new(hours, minutes)
  end

  def -(min)
    hours = @hours
    minutes = @minutes
    minutes -= min

    until minutes >= 0
      hours -= 1
      minutes = 60 - minutes.abs
    end
    hours = 24 + hours until hours >= 0

    Clock.new(hours, minutes)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end
end
