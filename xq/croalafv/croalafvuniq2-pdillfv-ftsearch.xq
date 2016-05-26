(: find matching clausulae in croala and pdill :)
(: return count of repetitions, ids of nodes in dbs :)
(: include links to nodes in full text db :)
declare namespace croala = "http://croala.ffzg.unizg.hr/";

declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
 
for $c in 1 to 173885
let $q := collection("croalafvuniq2")/claus/*:tr[$c]
let $match := ft:search("pdillfvrep2", $q/td[1])
let $matchid := db:node-id($match/../../td[3])
where $q/td[1]/text() = $match
return element tr 
{ $q/td , 
db:open-id("pdillfvrep2", $matchid)
}