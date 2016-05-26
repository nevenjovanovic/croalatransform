(: find matching repeated clausulae in Vitezovic and Ovid :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1 to 135
let $q := collection("vitezovicfvrep")//*:tr[$c]
let $match := ft:search("ovidfvrep", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("ovidfvrep", $matchid1) ,
db:open-id("ovidfvrep", $matchid2)
 }