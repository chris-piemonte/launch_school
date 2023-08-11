=begin

input: string
output: true/false
rules;
  explicit:
    - test whether the parentheses in the argument string are balanced
    - balanced pairs must start with `(` not `)`
  implicit:
    - it is balanced if there is no parentheses at all
algorithm:
  - define a method `balanced?(string)
  - crete a hash called `parentheses` containing `(` and `)` as keys
  - turn the argument string into an array of characters and iterate through it
    - if the element is a `(` add 1 to its value in the hash
    - if the element is a `)` add 1 to its value in the hash
    - return `false` of the hash value of `)` > hash value of `(`
  - return true

=end

def balanced_paren?(string)
  symbols = { '(' => 0, ')' => 0, '{' => 0, '}' => 0, '[' => 0, ']' => 0 }

  string.chars.each do |ele|
    symbols['('] += 1 if ele == '('
    symbols[')'] += 1 if ele == ')'
    symbols['{'] += 1 if ele == '{'
    symbols['}'] += 1 if ele == '}'
    symbols['['] += 1 if ele == '['
    symbols[']'] += 1 if ele == ']'
    return false if symbols['('] < symbols[')']
    return false if symbols['{'] < symbols['}']
    return false if symbols['['] < symbols[']']
  end

  return false if symbols['('] != symbols[')']
  return false if symbols['{'] != symbols['}']
  return false if symbols['['] != symbols[']']
  true
end

def balanced_quotes?(string)
  single_quotes = 0
  double_quotes = 0

  string.chars.each do |char|
    single_quotes += 1 if char == "'"
    double_quotes += 1 if char == '"'
  end

  return true if single_quotes.even? && double_quotes.even?
  false
end

def balanced?(string)
  return true if balanced_paren?(string) && balanced_quotes?(string)
  false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
