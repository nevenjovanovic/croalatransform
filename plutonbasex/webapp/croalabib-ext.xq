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
declare %rest:GET %rest:POST %rest:path("croalabib-gen")
function page:croalabib-gen() { 

(: Report number of authors writing prose, poetry etc. :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: genera</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: genera</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table>
    
    <thead>
      <tr>
          <td>Genera</td>
          <td>Auctorum</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:body
let $ln := $doc//tei:person
return element tbody {
element tr {
element td {
	"Omnes"
} ,
element td { 
 count($ln)
} 
},

element tr {
element td {
	"Poesis"
} ,
element td { 
 count($ln[tei:occupation[@code="tax.poesis"]])
} 
},

element tr {
element td {
	"Prosa"
} ,
element td { 
 count($ln[tei:occupation[@code="tax.prosa"]])
} 
},

element tr {
element td {
	"Poesis et prosa"
} ,
element td { 
 count($ln[tei:occupation[@code="tax.prosa"] and tei:occupation[@code="tax.poesis"]])
} 
},

element tr {
element td {
	"Nondum notati"
} ,
element td { 
 count($ln[not(tei:occupation[@code="tax.prosa"])][not(tei:occupation[@code="tax.poesis"])])
} 
}

}
}
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return
