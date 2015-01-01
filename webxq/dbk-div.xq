import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
declare option output:media-type "application/xml";
declare option output:method "xml";
declare %rest:GET %rest:POST %rest:path("dbk-div")
function page:dbk-div() { element c {
(: Return all divs with @ana attribute :)
for $div in collection("dbkref")//tei:div[@ana]
order by $div/@n
return <p>{$div/@n , data($div/@ana)}</p>
}
};
return

