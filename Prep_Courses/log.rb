def log descriptionofblock, &block
	puts "Beginning #{descriptionofblock}..."
	
	puts "...#{descriptionofblock} finished, returning: " + block.call.to_s
end

log "outer block" do
	log "some little block" do
		3+2
	end
	log "yet another block" do
		false
	end
	"I like Thai food"
end