(: find matching clausulae in croala and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1 to 1184
let $q := collection("croalafvrep")//*:tr[$c]
let $match := ft:search("pdillfvrep", $q/td[1])
let $matchid := db:node-id($match/../..)
where $q/td[1]/text() = $match
return element tr { $q/* , for $m in $matchid return db:open-id("pdillfvrep",$m)/td[position()>1] }