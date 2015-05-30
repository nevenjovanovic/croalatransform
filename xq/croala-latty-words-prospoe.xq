declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: return word count in prose and poetry respectively, prototype :)

declare function croala:quaedam () {
  let $a := ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
  return $a
};

declare function croala:round2($a,$b) {
  round($a div $b * 10000) div 10000
};


for $db in ("latty","croala")
let $textspp := 
  for $doc in collection($db)/*:TEI//*:text[not(descendant::*:text)]
  let $count := sum(
    for $d in $doc return ft:count($d//*:p[not(descendant::*:p) and text() contains text ".*" using wildcards])
  )
  let $countl := sum (
    
    for $d in $doc return ft:count($d//*:l[not(descendant::*:l) and text() contains text ".*" using wildcards])
  )
  
  for $t in croala:quaedam()
    let $term := ft:tokenize($t)
    let $entry := sum(for $e in $doc return ft:count($e//*:p[not(descendant::*:p) and text() contains text {$term}]))
    let $entryl := sum(for $e in $doc return ft:count($e//*:l[not(descendant::*:l) and text() contains text {$term}]))
  
  return element tr {
   element td { 
  element a { 
  attribute href {"http://solr.ffzg.hr/basex/node/" || $db || "/" || db:node-pre($doc) } ,
  db:path($doc) }
},
element td { count($doc) } ,
element td { $term } ,
element td { $entry },
element td { if ($count > 0) then croala:round2($entry, $count) else 0 } ,
element td { $count } ,
element td { $entryl },
element td { if ($countl > 0) then croala:round2($entryl, $countl) else 0 } ,
element td { $countl } }

return 
  for $t in $textspp order by $t/td[3] , $t/td[5] descending , $t/td[8] descending 
  return $t