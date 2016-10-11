def staggered_case(str, boolean = true)
  str.chars.each_with_index do |char, index|
    if boolean
      if index.even?
        char.upcase! 
      elsif index.odd?
        char.downcase!
      end
    else
      if index.odd?
        char.upcase! 
      elsif index.even?
        char.downcase!
      end
    end
  end.join('')
end

puts staggered_case('I Love Launch School!', false)
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
