(: find matching clausulae in croala / renaissance and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1 to 144
let $q := collection("croalafvrenrep2")//*:tr[$c]
let $match := ft:search("pdillfvrep2", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("pdillfvrep2", $matchid1) ,
db:open-id("pdillfvrep2", $matchid2)
 }