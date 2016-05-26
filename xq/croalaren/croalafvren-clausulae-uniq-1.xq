(: list unique single-word clausulae and nodes in croala ren :)
(: make link to file in philologic :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
let $body := element claus {
for $c in collection("croalafvrenclau1")//*:c
let $un := $c/text()
let $ln := element a { croala:solraddr("croala0", $c/@vid), substring-before($c/@target,'.xml') }
group by $un
where count($c) = 1
return element tr { 
element td { $un } , element td {count($c)} , element td { $ln } }
}
return db:create("croalafvrenuniq1", $body , "croalaclausulaeren1uniq.xml", map { 'ftindex': true(), 'intparse': true() })