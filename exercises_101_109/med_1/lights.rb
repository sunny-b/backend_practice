require 'pry'

#Create hash that has switches labeled and whether they are on or off
switches = (1..1000).to_a.zip([false] * 1000).to_h

#Iterate over hash, starting at 2.
#Each iteration starts one switch higher until it gets to 1000
#During each iteration

def toggle(switches)
  1.upto(1000) do |step|
    switches.map do |switch_num, on_or_off|
      if switch_num % step == 0
        switches[switch_num] = !on_or_off
      end
    end
  end
end

def on_switches(switches)
  switches.keys.select { |key| switches[key] == true }
end

toggle(switches)
puts "Lights #{on_switches(switches).join(', ')} are now on."
p on_switches(switches).size