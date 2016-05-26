(: create an index of lemmatised words :)
(: order by frequency descending, then alphabetically :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
 
for $w in collection("acdhcroala")//*:w[@lemma]
let $idx := $w/@lemma
group by $idx
order by count($w) descending , $idx
return element tr { 
element td { $idx } , element td { count($w) } , element td { for $n in db:node-id($w) return element a { croala:solraddr("acdhcroala", $n) , $n  } }
}