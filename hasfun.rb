movies = {
  :Die_Hard=>"1975",
  :Annie=>"1950",
  :Godzilla=>"2004",
  :Fahrenheit_451=>"2013",
  :Clerks=>"1999"
}

def print_movie hash_name
  hash_name.each do |key,value|
    puts "#{value}"
  end
end

print_movie(movies)