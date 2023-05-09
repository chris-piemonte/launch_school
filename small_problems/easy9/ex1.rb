=begin

input: 2 arguments
  array argument:
    - 2 or more elements that will combine to make a person's name
  hash element:
    - 2 k/v pairs, kets will be :title & :ocupation
output: a greeting that uses the person's full name and mentions their title and occupation
rules:
  explicit:
    - first argument an array
      - contains 2 + elements that combine into a person's name
    - second argument a hash
      - contains 2 keys with corresponding calues
        - :title & :occupation
    - returns their full name and mentions their title and occupation
  implicit:
    - greeting must be able to tombine any number of array elements into a name
    - must return the grereting, not just print it
algorithm:
  - define a method `greetings(array, hash)`
  - create a variable `name` equal to the concatenation of all elements in `array` by using iteration
    - iterate through `array`, push elements to `name` with a space
  - create a variable `occupation_title` equal to the values in `hash` by using iteration
    - iterate through `hash`, push the elemnts to `occupation_title` with a space

=end

# def greetings(array, hash)
#   name = ''
#   occupation_title = ''

#   array.each_with_index do |ele, ind|
#     name << ele
#     name << ' ' if ind < array.size - 1
#   end

#   occupation_title << hash[:title] + ' '
#   occupation_title << hash[:occupation]

#   return "Hello, #{name}! Nice to have a #{occupation_title} around."
# end

# def greetings(array, hash)
#   "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
# end

def greetings(array, hash)
  name = array.join(' ')
  occupation = "#{hash[:title]} #{hash[:occupation]}"

  "Hello, #{name}! Nice to have a #{occupation} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
