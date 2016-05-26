(: from three-word pdill unique clausulae in renaissance croala :)
(: with 30 or more letters :)
(: search for matches among two-word repeated croala/r :)
(: return matches :)
for $l in collection("pdillfvuniq3")/claus/*:tr[string-length(td[1]) >= 20]
let $match := db:text("croalafvrenrep3", $l/td[1])
return if ($match) then element tr { 
$l/* , 
db:open-id("croalafvrenrep3", db:node-id($match/../../td[2])) ,
db:open-id("croalafvrenrep3", db:node-id($match/../../td[3]))
 }
 else()