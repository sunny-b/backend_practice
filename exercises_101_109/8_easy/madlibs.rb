def prompt(msg)
  puts "=> #{msg}"
end

prompt('Enter a noun:')
noun = gets.chomp

prompt('Enter a verb:')
verb = gets.chomp

prompt('Enter an adjective:')
adjective = gets.chomp

prompt('Enter an adverb:')
adverb = gets.chomp

prompt("Do you #{verb} the #{adjective} #{noun} #{adverb}? That's hilarious.")