(: find matching repeated two-word clausulae in Vitezovic, unique in Ovid :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1 to 532
let $q := collection("vitezovicfvrep2")//*:tr[$c]
let $match := ft:search("ovidfvuniq2", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("ovidfvuniq2", $matchid1) ,
db:open-id("ovidfvuniq2", $matchid2)
 }