=begin

input: array of integers
output: array of same integers sorted based on the english word for each number
rules
  explicit:
  - array must be in aplhabetic order based on the word for the number
  implicit:
  - empty array returns an empty string
algorithm:
  - create a constant variable called `ORDER` that is a hash of the integers 0 - 19 as keys, and strings a - t as their values in chronological order
  - define a method `alphabetic_number_sort(array)`
  - iterate through `array`, transforming the elements into the a - t strings in `ORDER`
  - sort `array``
  - iterate trough `array`, transforming the strings back to their correcponding integers

=end

# ORDER = [
#   'zero', 'one', 'two', 'thre', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
#   'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
# ]

# def alphabetic_number_sort(array)
#   array.map! { |num| num = ORDER[num] }
#   array.sort.map! { |num| num = ORDER.index(num) }
# end

ORDER = %w(zero one two three four five six seven eight nine ten eleven twelve
           thirteen furteen fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(array)
#   array.sort_by { |num| ORDER[num] } 
# end

def alphabetic_number_sort(array)
  array.sort { |a, b| ORDER[a] <=> ORDER[b] }
end

p alphabetic_number_sort((0..19).to_a) #== [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,6, 16, 10, 13, 3, 12, 2, 0]
