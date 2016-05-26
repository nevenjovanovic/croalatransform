(: from single-word renaissance croala clausulae :)
(: with 9 or more letters, repeated :)
(: search for matches among single-word repeated pdill :)
(: return matches :)
for $l in collection("croalafvrenrep1")/tbody/*:tr[string-length(td[1]) > 10]
let $match := db:text("pdillfvrep1", $l/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $l/td[1]/text() = $match
return element tr { 
$l/* , 
db:open-id("pdillfvrep1", $matchid1) ,
db:open-id("pdillfvrep1", $matchid2)
 }