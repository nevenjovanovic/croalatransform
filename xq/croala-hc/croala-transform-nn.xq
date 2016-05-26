(: replace nn values in urns with croala-position number :)
let $cat := collection("hccroala-citation")
for $g at $count in $cat//*:online 
let $urn := $g/@urn
where starts-with($urn, "urn:cts:croala:nn")
let $newurn := replace($urn, "croala:nn\.", "croala:croala0" || $count || ".")
return replace value of node $urn with $newurn