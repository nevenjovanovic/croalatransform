(: from single-word renaissance croala clausulae :)
(: with 9 or more letters :)
(: search for matches among single-word repeated pdill :)
(: return matches :)
for $l in collection("croalafvrenuniq1")/claus/*:tr[string-length(td[1]) >= 11]
let $match := db:text("pdillfvrep1", $l/td[1])
return if ($match) then element tr { 
$l/* , 
db:open-id("pdillfvrep1", db:node-id($match/../../td[2])) ,
db:open-id("pdillfvrep1", db:node-id($match/../../td[3]))
 }
 else()