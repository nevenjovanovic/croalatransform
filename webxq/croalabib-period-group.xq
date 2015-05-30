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
declare %rest:GET %rest:POST %rest:path("croalabib-aucsaec")
function page:croalabib-aucsaec() { 

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
<h1>CroalaBib: auctores per saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }. Sequere "Auctores" ut nomina videas.</p>

{
(: The actual XQuery starts here :)
element table { 
element thead {
element tr {
element td { "Floruit" } , element td { attribute class {"broj"} , "Auctores" }
}
},
let $a :=
for $p in collection("croalabib")//tei:listPerson[@type="croala.auctores"]/tei:person
let $v := $p/tei:floruit[1]/@period
where $v/string() contains text { "14xx.*", "15xx.*", "16xx.*", "17xx.*", "18xx.*", "19xx.*" } using wildcards
group by $v
order by $v
return 
element tr  { 
element td { 
element a { attribute href { $v } , replace(replace($v, 'http://semium.org/time/', ''), 'hird', 'ertia') }
}, 
element td { attribute class {"broj" } , 
element a { attribute href {concat('http://solr.ffzg.hr/basex/croalabib-aucsaecx?saecq=', replace($v, 'http://semium.org/time/', ''))} , count($p/tei:persName[1]) }
}
}
return element tbody { $a ,
element tr { 
element td { } ,
element td {
attribute class { "broj" } ,
"N = ", sum($a/td[2]) } } 
}
}
}

     <p/>
<hr/>
<div>
<p>
<a href="http://www.ukf.hr/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/znanjepomocen.jpg?cache="/></a> <a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/tirollogo.png?cache="/></a></p>
</div>
</body>
</html>
};
return
