declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: find repeated clausulae in latty, return just those repeated in croala as well, with node ids in both dbs :)

(: make link to file in philologic :)
declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || $txtnode } 

 };

declare function croala:search($db,$clau) {
  let $l := collection($db)//*:l[text() contains text {$clau}]
  return if ($l) then element span { count($l) || ": " ,
  for $a in db:node-pre($l) return element a { croala:solraddr($db,$a) , $a } }
  else()
};



let $latty := element cl { 
  for $a in index:texts("lattyclausulae")
  where $a[xs:integer(@count) eq 1 and count(ft:tokenize(.)) gt 1]
  order by xs:integer($a/@count) descending
  return element tr { data($a)
}
}
for $c in $latty//tr
let $search := data($c)
where ft:search("croalaclausulae", $c)
order by $c
return element tr { 
element td {"latty " , croala:search("latty", $search) } ,
element td { $search } ,
element td { "croala "  , croala:search("croala", $search) }
}