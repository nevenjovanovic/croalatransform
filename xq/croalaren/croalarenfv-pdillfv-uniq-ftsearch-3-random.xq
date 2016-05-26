(: find random matching single-word clausulae in croala / renaissance unique and pdill repeated :)
(: return count of repetitions, ids of nodes in dbs :)
for $n in 1 to 1000
let $rnd := random:integer(93506) + 1
let $c := collection("croalafvrenuniq3")//*:tr[$rnd]
let $match := ft:search("pdillfvrep", $c/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $pdill1 := db:open-id("pdillfvrep", $matchid1)
let $matchid2 := db:node-id($match/../../td[3])
let $pdill2 := db:open-id("pdillfvrep", $matchid2)
where $c/td[1]/text() = $match
return element tr { 
$c/* , 
$pdill1 ,
$pdill2
 }