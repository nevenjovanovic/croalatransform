(: write repeated clausulae, with number of repetitions, to a db -- for croala :)
(: order descending :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };


let $body :=
element tbody { 
for $c in collection("croalafvclau1")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("croala0", $c/@vid), data($c/@vid) }
group by $un
where count($c) > 1
order by count($c) descending
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("croalafvrep1", $body , "croalaclausulae1rep.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })