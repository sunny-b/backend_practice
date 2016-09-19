=begin
This method takes an array of fruit names and returns an array with all the fruit names
cut in half. It will not cut a string that isn't a fruit. 
=end

def cut_fruits(fruits)
  fruits_name = ["lemon", "fig", "apple", "pear", "banana", "pineapple", "plum", "pomegranate", "cherry", 
  "tomato", "curian", "cantaloupe", "mangosteen", "mango", "peach", "orange", "apricot", "watermelon", "persimmon",
  "litchi", "pitaya", "coconut", "grape", "apricot", "jujube", "ginko", "durian", "blueberry", "hawthorn", "ginkgo", "carambola"]
 
 new_array=[]
  fruits.each do |fruit|
    if fruits_name.include? fruit
      new_array.push(fruit[0..((fruit.length/2.0)-1).ceil])
      new_array.push(fruit[(fruit.length/2.0).ceil..(fruit.length-1)])
    else
      new_array.push(fruit)
    end
  end
  return new_array
end
