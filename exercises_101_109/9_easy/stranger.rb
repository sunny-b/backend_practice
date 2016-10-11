def greetings(arr, hash)
  puts "=> Hello, #{arr.join(' ')}! Nice to have a #{hash[:title]} "\
       "#{hash[:occupation]} around."
end

greetings(%w(John Q Doe), title: 'Master', occupation: 'Plumber')
