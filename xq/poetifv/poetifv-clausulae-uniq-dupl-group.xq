(: list repeated clausulae, number of repetition, and nodes :)
(: order descending :)
(: make link to file in philologic :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
 
for $c in collection("poetifvclau3")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("poetiditalia", $c/@vid), data($c/@vid) }
group by $un
where count($c) = 1
order by count($c) descending
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }