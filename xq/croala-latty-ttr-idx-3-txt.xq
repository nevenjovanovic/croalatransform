(: create ttr index for croala and latty as database :)
(: executes in about 7890 ms :)
let $idx := element idx {
for $dbs in ("latty", "croala")
  let $nodes :=
  for $i in collection($dbs)//*:text[not(descendant::*:text) and descendant::text()]
  let $per := replace($i/ancestor::*:TEI//*:profileDesc[1]/*:creation/*:date[1]/@period, '_third', '')
  return element n { element nd { db:node-pre($i) } , element per { $per} }
for $n in $nodes
  let  $div := db:open-pre($dbs, $n/nd)
  let $per := $n/per
  let $tok := ft:tokenize($div)
  let $tokc := count($tok)
  let $typc := count(distinct-values($tok))
  return element div { 
    element db { db:name($div)},
    element id { db:node-pre($div)},
    element name { db:path($div)},
    $per ,
    element tok { $tokc } ,
    element typ { $typc },
    element ttr { if ($tokc gt 0) then round($typc div $tokc * 100) div 100 else () }
 }
}
return db:create("cl-idx-txts", $idx, "croala-latty-txts.xml")