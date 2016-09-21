family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }


new_arr = family.select {|k, v| k == :sisters || k == :brothers}.values.flatten

puts "#{new_arr}"