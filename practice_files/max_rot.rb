require 'pry'

def max_rot(n)
  m = n.to_s.split("")
  all_iterations = []
  
  (m.size - 1).times do |idx|
    val = m[idx..-1].shift
    m.push(val)
    m.delete_at(idx)
    all_iterations << m.join
  end
  
  all_iterations.max.to_i
end

p max_rot(507992495)


[1, 2, 3, 4, 5, 6]

{
  "Iris" => "girl",
  "Sunny" => "boy"
  "Clubs" => [A, 1, 2, 4, 5]
}