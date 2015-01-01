import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
declare option output:media-type "application/xml";
declare option output:method "xml";
declare %rest:GET %rest:POST %rest:path("dbk-cnt")
function page:dbk-cnt() { element c {
(: Count number of days with sessions in a month. :)
for $dies in collection("dbkref")//tei:div[@ana[. = 'mensis']]
let $cnt := count($dies/tei:div[@ana[. = 'dies']])
(: List all with more than 10 sessions: :)
where $cnt > 10
return <p>{$dies/@n}: {$cnt}</p>
}
};
return
