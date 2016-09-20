person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

if person.has_value? 'Bob'
  p "The value Bob is in this array!"
else
  p "The value is not in this array"
end