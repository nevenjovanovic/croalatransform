(: write unique two-word clausulae to a db -- for Ovid :)
(: order alphabetically :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };


let $body :=
element tbody { 
for $c in collection("ovidfvclau2")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("ovid-pdl", $c/@vid), data($c/@vid) }
group by $un
where count($c) = 1
order by $c
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("ovidfvuniq2", $body , "ovidclausulae2uniq.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })