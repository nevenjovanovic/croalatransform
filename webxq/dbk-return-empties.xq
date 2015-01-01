import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
declare option output:media-type "application/xml";
declare option output:method "xml";
declare %rest:GET %rest:POST %rest:path("empty")
function page:empty() {
element div { let $empties := ('pb', 'gap', 'lb')
for $i in collection("dbkref")//tei:text//tei:head[not(descendant::text())]
order by $i//*/@when
return
(: condition - if not one of... :)
if (not(index-of($empties, $i/name()))) 
then $i 
else() }
};
return
