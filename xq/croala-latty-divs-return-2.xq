(: return wc for divs :)
for $divs in
for $db in ("latty")
for $i in collection($db)//*:div[not(descendant::*:div)]
let $n := count(ft:tokenize($i))
return element tr {
  element td { db:path($i) } ,
  element td { db:node-pre($i)},
  element td { $n }
}
order by xs:integer($divs/td[3])
return $divs