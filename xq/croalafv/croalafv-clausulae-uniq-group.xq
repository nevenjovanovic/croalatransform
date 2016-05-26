(: list repeated clausulae, number of repetition, and nodes :)
(: order descending :)
(: make link to file in philologic :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
let $body := element claus {
for $c in collection("croalafvclau3")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("croala0", $c/@vid), data($c/@vid) }
group by $un
where count($c) = 1
order by count($c) descending
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("croalafvuniq1", $body , "croalaclausulaeuniq.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })