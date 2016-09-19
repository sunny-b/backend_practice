regex = ['laboratory', 'experiment', 'Pans Labyrinth', 'elaborate', 'polar bear']

regex.each do |word|
  if /lab/ =~ word
    puts word
  end
end