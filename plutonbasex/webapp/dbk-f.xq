import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";

declare %rest:GET %rest:POST %rest:path("dbk-dies")
function page:dbk-dies() { element report {
(: Return all @n values of divs with @ana="dies" :)
for $day in collection("dbkref")//tei:div[@ana[. = 'dies']]
return data($day/@n)
}
};
return
