for $ww in 
let $w := collection("ghlh-rdf")/*/*:Description/*:wordform[@xml:lang='grc']
return distinct-values($w[ends-with(.,"'")])
order by $ww collation "?lang=el"
return $ww