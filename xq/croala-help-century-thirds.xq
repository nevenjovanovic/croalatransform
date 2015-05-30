(: recur to make centuries and their thirds :)
for $x in 10 to 19
for $y in 1 to 3
return element s { $x || "xx_" || $y || "_third" }