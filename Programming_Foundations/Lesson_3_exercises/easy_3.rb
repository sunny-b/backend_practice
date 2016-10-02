#Q1 

flintstones = %w(Fred Barney Wilma Better BamBam Pebbles)

#Q2

flintstones << "Dino"

#Q3

flintstones.insert(-1, "Dino", "Hoppy")

flintstones.concat(["Dino", "Hoppy"])

flintstones.push("Dino", "Hoppy")

#Q4

advice.splice!(0, advice.index("house"))

#Q5

statement.count 't'

statement.scan("t").count

#Q6

title.center(40)
