(: from single-word pdill clausulae in renaissance croala :)
(: with 11 or more letters :)
(: search for matches among single-word repeated croala/r :)
(: return matches :)
for $l in collection("pdillfvuniq1")/tbody/*:tr[string-length(td[1]) >= 11]
let $match := db:text("croalafvrenrep1", $l/td[1])
return if ($match) then element tr { 
$l/* , 
db:open-id("croalafvrenrep1", db:node-id($match/../../td[2])) ,
db:open-id("croalafvrenrep1", db:node-id($match/../../td[3]))
 }
 else()