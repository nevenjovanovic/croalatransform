import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare %rest:GET %rest:POST %rest:path("person2")
%rest:query-param("var", "{$var}")
function page:person($var as xs:integer) { 
element div { 
for $i in collection("croalabib")//tei:person[$var] 
return ( element p { $i/tei:persName//text() } ) 
}
};
return
