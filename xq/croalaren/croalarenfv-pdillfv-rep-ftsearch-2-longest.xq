(: find longest matching clausulae in croala / renaissance and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in collection("croalafvrenrep2")//*:tr
where string-length($c/*:td[1]) > 17
let $match := ft:search("pdillfvrep2", $c/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $c/td[1]/text() = $match
return element tr { 
$c/* , 
db:open-id("pdillfvrep2", $matchid1) ,
db:open-id("pdillfvrep2", $matchid2)
 }