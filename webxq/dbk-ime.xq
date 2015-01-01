import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
declare option output:media-type "application/xml";
declare option output:method "xml";
declare %rest:GET %rest:POST %rest:path("dbk-ime")
function page:dbk-ime() { element report {
(: Add title :)
element title { "Variants of a name" } ,
(: Return all mentions in the text of the person with a certain ID :)
(: Get text :)
let $i1 := for $ime in collection("dbkref")//tei:persName[@ref[. = 'BABALVOL1390-01']]/text()
(: Order passages alphabetically :)
order by $ime
return $ime
(: Remove duplicates :)
return for $i2 in distinct-values($i1)
return element p { $i2 }
}
};
return
