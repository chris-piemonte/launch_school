=begin
Mortgage Calculator

Need:
  loan amount
  Annual Percentage Rate (APR)
  loan duration

Calculate:
  monthly interest rate
  loan duration in months
  monthly payment

Formula:
  m = p * (j / (1 - (1 + j)**(-n)))
  m = monthly payment
  p = loan amount
  j = monthly interest rate
  n = loan duration in months

introduction, ask for name
ask for loan amount
ask for the APR
ask for the loan duration

convert APR to monthly interest rate
  - divide by 12
conver loan duration into months
  - multiply by 12
calculate the monthly payment using formula
present the interest rate, loan duration in months, and monthly payment
ask if they want to calculate another mortgage
=end

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

name = ''
prompt "Welcoome to the Mortgage Calculator! Please enter your name:"
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you enter a valid name."
  else
    break
  end
end

loan = ''
prompt "Hello #{name}!"

loop do
  prompt "what is the dollar amount of your loan?"
  loop do
    loan = gets.chomp

    if number?(loan)
      break
    else
      prompt "Make sure you enter a valid number."
    end
  end

  apr = ''
  loop do
    prompt "What is your Annual Percentage Rate (APR)?"
    apr = gets.chomp

    if number?(apr)
      break
    else
      prompt "Make sure you enter a valid number."
    end
  end

  loan_years = ''
  loop do
    prompt "What is the duration of your loan? First, how many years?"
    loan_years = gets.chomp

    if integer?(loan_years)
      break
    else
      prompt "Make sure you enter a valid number, no decimals."
    end
  end

  loan_years_months = ''
  loop do
    prompt "How many months?"
    loan_years_months = gets.chomp

    if integer?(loan_years_months)
      break
    else
      prompt "Make sure you enter a valid number, no decimals."
    end
  end

  monthly_rate = (apr.to_f / 100) / 12
  loan_months = (loan_years.to_i * 12) + loan_years_months.to_i
  monthly_payments = (loan.to_i * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))).round(2)
  prompt "Your monthly payment is $#{monthly_payments}."   

  prompt "Would you like to calculate another mortgage? (Y to calculate again)."
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using the Mortgagge Caluclator. Goodbye!"

# puts "loan #{loan}"
# puts "APR #{apr}"
# puts "loan in years #{loan_years}"
# puts "loan additional months #{loan_years_months}"
# puts "monthly rate #{monthly_rate}"
# puts "loan in months #{loan_months}"
# puts "monthly_payments #{monthly_payments}"
