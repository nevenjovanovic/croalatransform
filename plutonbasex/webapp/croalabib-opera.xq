import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
</head>

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>CroalaBib: opera</h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
</div>
      <div class="container-fluid">
      <blockquote class="croala">
      <div class="table-responsive">
{ 
(: The actual XQuery starts here :)
let $doc1 := collection("croalabib")//tei:listBibl[@ana="croala.opera"]/(tei:bibl | tei:biblStruct/tei:monogr)[tei:title contains text { $opq } using wildcards ]
return element table {
attribute class {"table-striped  table-hover table-centered"} ,
element thead {
	element tr {
element td { "In croalabib invenimus ", element b { $opq } , ": " , element b { count($doc1) }, "." } , element td { "Ordinatum alphabetice per titulum." }
},
element tr {
element td {"ID"} ,
element td {"Titulus"},
element td {"Auctor et ID"},
element td {"Tempus"}
} } ,
element tbody {
for $doc in $doc1
order by $doc/tei:title[1]
return
element tr { 
element td { $doc/@xml:id/string() } ,
element td { $doc/tei:title[1]//text() } ,

if(exists($doc/tei:author)) then 
element td { data($doc/tei:author),
 element b { " &#8212; A ID: " }, $doc/tei:author/tei:ref/@target/string() }
else(),

if(exists($doc//tei:date)) then 
element td { data($doc//tei:date[1]) }
else()
}

}
}
}
</div>
</blockquote>
     <p/>
</div>
<hr/>
{ croala:footer() }
</div>
    </body>
</html>
};
return
