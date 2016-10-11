def buy_fruit(arrs)
  grocery_list = []
  arrs.map do |arr|
    arr.last.times do 
      grocery_list << arr.first
    end
  end
  grocery_list
end

def buy_fruit2(list)
  list.map { |fruit, number| [fruit] * number }.flatten
end

puts buy_fruit2([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]