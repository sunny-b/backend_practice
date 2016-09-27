def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  (num.to_i.to_s == num || num.to_f.to_s == num) && num.to_f >= 0
end

def retrieve_user_input(question)
  loop do
    prompt(question)
    answer = gets.chomp
    if valid_number?(answer)
      return answer
    else
      prompt('Error: Not a valid number')
    end
  end
end

prompt("Welcome to Mortgage Calculator!")
puts
loop do
  loan_amount = retrieve_user_input("Enter your total loan amount:").to_f

  apr_request = <<-MSG
  What is your APR?
  (Example: 5 for 5% or 2.5 for 2.5%)
  MSG

  apr = retrieve_user_input(apr_request).to_f

  duration_years = retrieve_user_input("Enter your loan duration in years:")

  monthly_interest = apr / 1200.0
  duration_months = duration_years.to_f * 12.0

  if duration_months.zero?
    monthly_payment = loan_amount
  elsif apr.zero?
    monthly_payment = loan_amount / duration_months
  else
    monthly_payment = loan_amount *
                      (monthly_interest /
                      (1 - (1 + monthly_interest)**-duration_months))
  end

  prompt("Based on the information you've given...")

  if duration_months.zero?
    prompt("Your total payment is $#{format('%02.2f', monthly_payment)}")
  else
    prompt("Your monthly payment should be " \
           "$#{format('%02.2f', monthly_payment)}")
  end

  puts
  prompt("Would you like to calculate another mortgage?(Y/N)")
  calc_again = gets.chomp.downcase
  break unless calc_again == 'y' || calc_again == 'yes'
end

prompt("Thank you for using Mortgage Calculator, goodbye!")
