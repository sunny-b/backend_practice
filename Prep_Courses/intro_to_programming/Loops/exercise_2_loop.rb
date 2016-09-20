command = ""
while command != "STOP"
  print "Input a command, or type STOP to exit: "
  command = gets.chomp
  if command == "STOP"
    break
  end
  puts "Your wrote #{command}"
end