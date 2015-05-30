(: find number of particular words in two db's, return count using fulltext index, and percentage of total words:)
let $rijeci := element rijeci { for $db in ("croala", "latty")
let $count := ft:count(collection($db)//*:text[not(descendant::*:text)]//*[text() contains text ".*" using wildcards])
for $t in ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
let $term := ft:tokenize($t)
let $entry := ft:tokens($db, $term)[. = $term][1]
let $entrycount := number($entry/@count)
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
  element td { $entry/text() },
  element td { $entrycount },
  element td { round($entrycount div $count * 100000) div 100000 }  }
else()
}
for $rr in $rijeci/tr
order by $rr/td[2]
return $rr