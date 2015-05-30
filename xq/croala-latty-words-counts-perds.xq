(: find number of particular words in periods in two db's, return count using fulltext index, and percentage of total words :)
let $rijeci := element rijeci { 
for $db in ("latty")
 for $periods in distinct-values(collection($db)/descendant::*:profileDesc[1]/*:creation/*:date/@period)
  let $verba := collection($db)/*:TEI[descendant::*:profileDesc[1]/*:creation/*:date/@period=$periods]//*:text[not(descendant::*:text)]
  let $count := sum(
    for $d in $verba return ft:count($d//*[text() contains text ".*" using wildcards])
  )
    for $t in ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
    let $term := ft:tokenize($t)
    let $entry := sum(for $e in $verba return ft:count($e//*[text() contains text {$term}]))
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
    element td { 
    element a {
      attribute href { "http://solr.ffzg.hr/basex/" || $db || "/" || $periods || "/docs" } ,
    $periods
  }
  },
  element td { $term } ,
  element td { $entry },
  element td { round($entry div $count * 100000) div 100000 } ,
  element td { $count } }
else()
}
for $rr in $rijeci/tr
order by $rr/td[3] , $rr/td[2] , number($rr/td[5]) descending , number($rr/td[6]) descending
return $rr