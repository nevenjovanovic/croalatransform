(: find matching clausulae in croala / renaissance and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 15 to 205
let $q := collection("croalafvrenrep3")//*:tr[$c]
let $match := ft:search("pdillfvrep", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("pdillfvrep", $matchid1) ,
db:open-id("pdillfvrep", $matchid2)
 }