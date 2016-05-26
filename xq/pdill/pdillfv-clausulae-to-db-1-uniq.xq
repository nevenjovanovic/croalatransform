(: write unique clausulae to a db -- for poetiditalia :)
(: order descending :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };

let $body :=
element tbody { 
for $c in collection("pdillfvclau1")/claus/*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("pdill0", $c/@vid), substring-before($c/@target,'.xml') }
group by $un
where count($c) = 1
order by count($c) descending
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("pdillfvuniq1", $body , "pdillclausulae1uniq.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })