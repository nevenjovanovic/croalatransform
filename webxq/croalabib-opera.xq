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
declare %rest:GET %rest:POST %rest:path("croalabib-opera")
%rest:query-param("opq", "{$opq}")
function page:croalabib-opera($opq as xs:string) { 

(: Present an work title and ID / author name and ID page :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: opera</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: opera</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>


{ 
(: The actual XQuery starts here :)
let $doc1 := collection("croalabib")//tei:listBibl[@ana="croala.opera"]/(tei:bibl | tei:biblStruct/tei:monogr)[tei:title contains text { $opq } using wildcards ]
return element div {
element p { "In croalabib invenimus ", element b { $opq } , ": " , element b { count($doc1) }, ". Ordinatum alphabetice per titulum." } ,
element div {
for $doc in $doc1
order by $doc/tei:title[1]
return
element blockquote { element title { "T ID: " , $doc/@xml:id/string() } ,
element title { "T: " , $doc/tei:title[1]//text() } ,

if(exists($doc/tei:author)) then 
element birth { element b { "A: "} , data($doc/tei:author),
 element b { " &#8212; A ID: " }, $doc/tei:author/tei:ref/@target/string() }
else(),

if(exists($doc//tei:date)) then 
element birth { element b { "D: "} , data($doc//tei:date[1]) }
else()
}

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
