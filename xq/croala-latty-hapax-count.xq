for $names in //*:TEI
let $toks := ft:tokenize(db:open("latty", db:path($names) )//*:text)
let $hapax := count(
for $b in distinct-values($toks)
let $count := count(index-of($toks,$b))
where $count = 1
return $b )
return $hapax