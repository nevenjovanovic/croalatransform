(: find matching clausulae in croala and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
for $c in 1185 to 6133
let $q := collection("croalafvrep")//*:tr[$c]
let $match := ft:search("pdillfvrep", $q/td[1])
where $q/td[1]/text() = $match
return element tr { $q/* , collection("pdillfvrep")//tr[td[1] = $match]/td[position()>1] }