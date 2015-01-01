let $nodes := for $a in collection("imena")//*:name/text()
(: return index nodes of results in text database :)
let $wcount := db:node-pre(collection("latty")//*:text//text()[. contains text {$a}])
return $wcount
for $number in $nodes
order by number($number)
return $number