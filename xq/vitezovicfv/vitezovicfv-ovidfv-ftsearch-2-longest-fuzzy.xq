(: find longest matching two-word clausulae in Vitezović / Ovid :)
(: return count of repetitions, ids of nodes in dbs :)
for $coll in ("vitezovicfvrep2", "vitezovicfvuniq2")
for $c in collection($coll)//*:tr
where string-length($c/*:td[1]) > 12
let $match := ft:search("ovidfvuniq2", $c/td[1], map { 'fuzzy': 'true' }) 
let $matchid1 := db:node-id($match/../../td[2]/text())
let $matchid2 := db:node-id($match/../../td[3]/a)
where $c/td[1]/text() = $match
return element tr { 
$c/* , 
element td {
for $m1 in $matchid1 return db:open-id("ovidfvuniq2", $m1)
} ,
element td {
for $m2 in $matchid2 return db:open-id("ovidfvuniq2", $m2)
}
 }