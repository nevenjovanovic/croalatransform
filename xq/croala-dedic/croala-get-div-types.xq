(: list distinct div types alphabetically :)
let $collection := "croala0"
for $n in distinct-values(collection($collection)//*:div/@type)
order by $n
return $n