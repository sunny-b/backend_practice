def cut_fruits(fruits)
  new_array=[]
  fruits.each do |fruit|
    if $fruits_name.include? fruit
      new_array.push(fruit[0..((fruit.length/2.0)-1).ceil])
      new_array.push(fruit[(fruit.length/2.0).ceil..(fruit.length-1)])
    else
      new_array.push(fruit)
    end
  end
  return new_array
end
