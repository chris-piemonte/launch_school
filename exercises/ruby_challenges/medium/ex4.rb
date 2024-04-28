=begin

PROBLEM
Construct objects that represent a meetup date

input:
  - instantiation: year, month number (1-12)
  - instance method: day of week, discriptor
output:
  - Date.civil representation

rules:
  explicit:
    - descriptors for day: first, second, third, fourth, fifth, last, teenth
    - The streing is not case sensitive for instance method
    - return datr with method

DATA
- class `Meetup`
  -constructor method
    - month, year
  - class method `day(weekday, schedule)`
    - weekday = day of the week
    - schedule is first, second, third, fourth, fifth, last,
    - output date

ALGORITHM
- require 'date'
- Define a class `Meetup(year, month)`
  - define a constructor method w/ year & month instance variables
  -define an instance method `day(weekday, schedule)`
    - iterate from 1st to last day in the month
      - if current day matches `weekday` & `schedule`, return date

=end

require 'date'

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    current_date = Date.new(year, month, 1)
    current_date.upto(current_date.next_month.prev_day) do |date|
      return date if correct_weekday?(weekday, date) &&
                     correct_schedule?(schedule, date)
    end
    nil
  end

  private

  def correct_weekday?(weekday, date)
    case weekday.downcase
    when 'monday' then date.monday?
    when 'tuesday' then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday' then date.thursday?
    when 'friday' then date.friday?
    when 'saturday' then date.saturday?
    else date.sunday?
    end
  end

  def correct_schedule?(schedule, date)
    case schedule.downcase
    when 'first' then date.day <= 7
    when 'second' then (8..14).include?(date.day)
    when 'third' then (15..21).include?(date.day)
    when 'fourth' then (22..28).include?(date.day)
    when 'fifth' then date.day >= 29
    when 'teenth' then (13..19).include?(date.day)
    else date.month != (date + 7).month
    end
  end
end
