def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }


#This will not pring anything to the screen because you forgot the
# ".call". So when the method is called, it will not call the block that is passed it.
# It will just return the block object.