def grandClock &block
	current = Time.now.sec
	while true
		later = Time.now.sec
		if current != later
			block.call
			current = Time.now.sec
		end
	end
end

grandClock do
	puts Time.new.sec
end