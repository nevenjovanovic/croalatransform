(: find matching repeated three-word clausulae in Vitezovic, unique in Ovid :)
(: return count of repetitions, ids of nodes in dbs :)
(: produces no results :)
for $c in 1 to 135
let $q := collection("vitezovicfvrep")//*:tr[$c]
let $match := ft:search("ovidfvuniq3", $q/td[1])
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr { 
$q/* , 
db:open-id("ovidfvuniq3", $matchid1) ,
db:open-id("ovidfvuniq3", $matchid2)
 }