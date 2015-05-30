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
declare %rest:GET %rest:POST %rest:path("croalabib-ql")
function page:croalabib-ql() { 

(: Report number of publications by Semium thirds periods :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: quando libri editi sint</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: quando libri editi sint</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table>
    
    <thead>
      <tr>
          <td>Saeculum</td>
          <td>Librorum</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:body
let $ln := $doc//*:imprint/*:date[@period]
return element tbody {
element tr {
element td {
	"15"
} ,
element td { 
 count($ln/@period[contains(.,'/14xx')])
} 
},

element tr {
element td {
	"16"
} ,
element td { 
 count($ln/@period[contains(.,'/15xx')])
} 
},

element tr {
element td {
	"17"
} ,
element td { 
 count($ln/@period[contains(.,'/16xx')])
} 
},

element tr {
element td {
	"18"
} ,
element td { 
 count($ln/@period[contains(.,'/17xx')])
} 
},

element tr {
element td {
	"19"
} ,
element td { 
 count($ln/@period[contains(.,'/18xx')])
} 
} ,

element tr {
element td {
	"xx"
} ,
element td { 
 count($doc//*:imprint/*:date[not(@period)])
} 
},

element tr {
element td {
	"Omnes"
} ,
element td { 
 count($doc//*:imprint/*:date)
} 
}

}
}
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p><a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et Tyrolensia</a>
<a href="http://www.ukf.hr/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/znanjepomocen.jpg?cache="/></a> <a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/tirollogo.png?cache="/></a></p>
</div>
</body>
</html>
};
return
