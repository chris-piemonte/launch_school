require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(messages, lang='en')
  MESSAGES[lang][messages]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  operation = case op
              when '1'
                'Adding'
              when '2'
                'Subtracting'
              when '3'
                'Multiplying'
              when '4'
                'Dividing'
              end

  operation
end

prompt messages('welcome')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt messages('valid_name')
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt messages('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt messages('valid_number')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include? operator
      break
    else
      prompt messages('valid_operator')
    end
  end

  if operator == '1'
    result = number1.to_f + number2.to_f
  elsif operator == '2'
    result = number1.to_f - number2.to_f
  elsif operator == '3'
    result = number1.to_f * number2.to_f
  else
    result = number1.to_f / number2.to_f
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"

  prompt messages('again')
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt messages('goodbye')
