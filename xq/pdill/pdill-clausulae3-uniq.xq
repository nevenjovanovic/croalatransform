(: list unique clausulae and nodes in pdill :)
(: make link to pdill0 node :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
let $body := element claus {
for $c in collection("pdillfvclau3")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("pdill0", $c/@vid), substring-before($c/@target,'.xml') }
group by $un
where count($c) = 1
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("pdillfvuniq3", $body , "pdillclausulae3uniq.xml", map { 'ftindex': true(), 'intparse': true() })