(: from pdill, find matching clausulae in croala / renaissance :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1 to 73
let $q := collection("pdillfvrep")//*:tr[$c]
let $match := ft:search("croalafvrenrep3", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("croalafvrenrep3", $matchid1) ,
db:open-id("croalafvrenrep3", $matchid2)
 }