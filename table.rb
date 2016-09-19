lineWidth = 50
title = "Table of Contents"
chap1 = "Chapter 1: Numbers"
chap2 = "Chapter 2: Letters"
chap3 = "Chapter 3: Variables"
page1 = "page 1"
page2 = "page 72"
page3 = "page 118"
puts title.center lineWidth
puts ""
puts chap1.ljust(lineWidth/2) + page1.rjust(lineWidth/2)
puts chap2.ljust(lineWidth/2) + page2.rjust(lineWidth/2)
puts chap3.ljust(lineWidth/2) + page3.rjust(lineWidth/2)