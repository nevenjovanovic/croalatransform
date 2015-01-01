import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare %rest:GET %rest:POST %rest:path("croalabib-aucsaecx")
%rest:query-param("saecq", "{$saecq}")
function page:croalabib-aucsaecx($saecq as xs:string) { 

(: Present an authors and centuries page :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: auctores per saecula</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: nomina auctorum per saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

{
(: The actual XQuery starts here :)
element table { 
element thead {
element tr {
element td { "Floruit" } , element td { "Auctores" }
}
},
let $a :=
for $p in collection("croalabib")//tei:listPerson[@type="croala.auctores"]/tei:person
let $v := $p/tei:floruit[1]/@period
where $v/string() contains text { $saecq }
group by $v
order by $v
return 
element tr  { 
element td { 
element a { attribute href { $v } , replace(replace($v, 'http://semium.org/time/', ''), 'hird', 'ertia') }
}, 
element td { string-join($p/tei:persName[1], '; ') }
}
return element tbody { $a
}
}
}

     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return
