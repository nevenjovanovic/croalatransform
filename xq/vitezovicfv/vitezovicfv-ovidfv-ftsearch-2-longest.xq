(: find longest matching two-word clausulae in Vitezović / Ovid :)
(: return count of repetitions, ids of nodes in dbs :)
for $coll in ("vitezovicfvrep2", "vitezovicfvuniq2")
for $c in collection($coll)//*:tr
where string-length($c/*:td[1]) > 14
let $match := ft:search("ovidfvuniq2", $c/td[1], map { 'fuzzy': 'true' }) 
let $matchid1 := db:node-id($match/../../td[2])
let $matchid2 := db:node-id($match/../../td[3])
where $c/td[1]/text() = $match
return element tr { 
$c/* , 
db:open-id("ovidfvuniq2", $matchid1) ,
db:open-id("ovidfvuniq2", $matchid2)
 }