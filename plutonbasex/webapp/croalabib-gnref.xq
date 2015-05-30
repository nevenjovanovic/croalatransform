import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare %rest:GET %rest:POST %rest:path("geonamref")
%rest:query-param("var", "{$var}")
function page:geonamref($var as xs:string) { 
element div { 
for $i in collection("croalabib")//tei:biblStruct[descendant::tei:imprint/tei:pubPlace[descendant-or-self::*[@ref=$var]]]
return ( element p { $i } ) 
}
};
return
