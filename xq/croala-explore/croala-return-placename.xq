(: return distinct placenames :)
let $placenamelist := for $f in collection("croala0")/*:TEI//*:text//*:placeName
order by $f
return normalize-space($f)
return distinct-values($placenamelist)