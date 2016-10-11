require 'pry'

def staggered_case(str, boolean = true)
  needs_upper = true
  str.chars.each_with_index do |char, index|
    if boolean
      if !char.match(/[A-Za-z]/)
        next
      elsif needs_upper
        char.upcase!
      else 
        char.downcase!
      end 
      needs_upper = !needs_upper
    else
      if needs_upper
        char.upcase!
      else 
        char.downcase!
      end 
      needs_upper = !needs_upper
    end
  end.join('')
end

puts staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
