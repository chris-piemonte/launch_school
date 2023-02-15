## Sum Even Number Rows

=begin
Imagine a sequence of consecutive even integers beginning with 2. The integers
are grouped in rows, with the first row containing one integer, the second rows
two integers, the third row three integers, and so on. Given an integer
representing the number of a particular row, return an integer representing the
sum of all the integers in that row.

**Rules/Requirements**

- Sequence of even integers
- Sequence begins with 2
- Integers are consecutive
- Sequence is grouped into rows
- Each row incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the rows
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the intgers in the row identified by the input integer

- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, ...

2
4, 6
8, 10, 12
14, 16, 18, 20
....

- How do we create the structure?

**Examples**

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68
  
2 - 2
4, 6 - 10

14, 16, 18, 20 - 68

**Data Structure**

2
4, 6
8, 10, 12
14, 16, 18, 20
....

- Overall structure represents sequence as a whole
- Individual rows within overall sructure
- Individuals row in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order i the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]

**Algorithm**

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'rows' arrray
3. Repeat step 2 until all the necessary rows have been created
  - All rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum

*Problem: Create a row*

Rules:
- Row is an array
- Array contain integers
- Integers are consecutive even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself: '[8, 10, 12]'

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data structures:
- An array of integers

Algorithm:
1. Create an empty 'row' array to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 & 3 until the array has reached the length
5. Return the 'row' array


*Problem: Calculating the start integer*
- Rule: First integer of row == last integer of preceding row + 2
- Algorithm:
  - get the last row of the rows array
  - get last integer of that row
  - add 2 to the integer

## Final Thoughts

- Not a completely linear process
- Move back and forward between the steps
- Switch from implementation mode to abstract problem solving mode when necessary
- DOn't try to problem solve at the code level
  =end

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10 # true
p sum_even_number_row(4) == 68 # true

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]
