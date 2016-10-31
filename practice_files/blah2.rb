def reverse(string)
  rotations = string.chars.length / 2

  rotations.times do |index|
    second_char = -(index + 1)
    
    string[index], string[second_char] =
    string[second_char], string[index]
  end

  string
end

p reverse("hello")
p reverse("pickles")

p reverse("racecar") == "racecar"
