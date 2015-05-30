let $q := for $g in 1090 to 1110
let $claus := for $i in file:read-text-lines("/home/neven/rad/croala-r/latty-clausulae-uniq.txt")
return element c { $i }
return $claus[$g]
for $l in collection("croala")//*:l
where $l[. contains text {$q}]
return element hit { ft:mark($l[text() contains text {$q}]) }