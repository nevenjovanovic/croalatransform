(: return word count in text part of db :)
(: use croalalattywc to return word counts for each text part in dbs:)
(: present totals first, word counts in descending order mixing the dbs :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: total wcs, nicely formatted :)
declare function croala:wcsve ($db) {
  format-number(
  sum(for $i in collection($db)//*:text[not(descendant::*:text)]
  return count(ft:tokenize($i)) ), "#,##0")
};

(: make link to file in philologic :)
declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };

(: return counts for individual texts, order by word count descending :)
declare function croala:wc () { 
for $dc in collection("croalalattywc2-txts")/text
let $db := data($dc/db)
let $name := data($dc/fn)
let $txtnode := data($dc/txtid)
let $wc := xs:integer($dc/wc)
order by $wc descending
return element tr { 
element td {
  attribute class { $db },
  $db
},
element td { 
element a { 
  croala:solraddr($db, $txtnode),
  $name
}
},
element td { attribute class {"clausula"} , format-number($wc, "#,##0") }
}
};

for $db in ("croala", "latty")
return element tr { 
element td {
  attribute class { $db },
  $db
},
element td { count(collection($db)//*:text[not(descendant::*:text)]) } , 
element td { attribute class {"clausula"} , croala:wcsve($db) } } , 
croala:wc() 
