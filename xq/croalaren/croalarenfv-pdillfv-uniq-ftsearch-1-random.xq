(: find random matching single-word clausulae in croala / renaissance unique and pdill repeated :)
(: return count of repetitions, ids of nodes in dbs :)
for $n in 1 to 10
let $rnd := random:integer(8125) + 1
let $c := collection("croalafvrenuniq1")//*:tr[$rnd]
let $match := ft:search("pdillfvrep1", $c/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $c/td[1]/text() = $match
return element tr { 
$c/* , 
db:open-id("pdillfvrep1", $matchid1) ,
db:open-id("pdillfvrep1", $matchid2)
 }