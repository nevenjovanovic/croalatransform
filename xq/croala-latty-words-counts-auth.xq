(: find number of particular words in two db's, return count using fulltext index, and percentage of total words:)
(: prebrojiti u svim dokumentima jednog autora... :)
let $rijeci := element rijeci { 
for $db in ("latty", "croala")
for $auctores in distinct-values(collection($db)/*:TEI/descendant::*:titleStmt/*:author/@key)
let $verba := collection($db)/*:TEI[descendant::*:titleStmt/*:author/@key=$auctores]//*:text[not(descendant::*:text)]
let $count := ft:count($verba//*[text() contains text ".*" using wildcards])
for $t in ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
let $term := ft:tokenize($t)
let $entry := ft:count($verba//*[text() contains text {$t}])
let $entrycount := number($entry)
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
    element td { 
    element a {
      attribute href { "http://solr.ffzg.hr/basex/auctor/" || $auctores } ,
    $auctores
  }
  },
  element td { $entry },
  element td { $entrycount },
  element td { round($entrycount div $count * 100000) div 100000 } ,
  element td { $count } }
else()
}
for $rr in $rijeci/tr
order by $rr/td[3] , number($rr/td[6]) descending
return $rr