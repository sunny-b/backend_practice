def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
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

loan_amount = nil
apr = nil
duration_years = nil
monthly_payment = nil
monthly_interest = nil
duration_months = nil

prompt("Welcome to Mortgage Calculator!")
puts
loop do
  loan_amount = retrieve_user_input("Enter your total loan amount in dollars:")

  apr_request = <<-MSG
  What is your APR?
  (Example: 5 for 5% or 2.5 for 2.5%)
  MSG

  apr = retrieve_user_input(apr_request)

  duration_years = retrieve_user_input("Enter your loan duration in years:")

  monthly_interest = apr.to_f / 1200.0
  duration_months = duration_years.to_f * 12.0

  monthly_payment = loan_amount.to_f *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**-duration_months))

  prompt("Based on the information you've given...")
  prompt("Your monthly payment shoulde be " \
         "$#{format('%02.2f', monthly_payment)} a month")
  puts
  prompt("Would you like to calculate another mortgage?(Y/N)")
  calc_again = gets.chomp
  break unless calc_again.casecmp('y').zero? || calc_again.casecmp('yes').zero?
end

prompt("Thanks for using Mortgage Calculator!")
