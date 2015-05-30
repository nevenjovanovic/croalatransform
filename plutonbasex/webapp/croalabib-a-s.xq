import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare function croala:saec($input) {
   collection("croalabib")//tei:person[(tei:birth, tei:death, tei:floruit)[tei:date[matches(@period,$input)]]]
};

declare %rest:GET %rest:POST %rest:path("croalabib-gen-saec")
function page:croalabib-gen-saec() { 

(: Report number of authors writing prose, poetry etc. :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: auctores genera saecula</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: auctores genera saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table>
    
    <thead>
      <tr>
          <td>Auctores</td>
          <td>Saec. XV</td>
          <td>Saec. XVI</td>
          <td>Saec. XVII</td>
          <td>Saec. XVIII</td>
          <td>Saec. XIX</td>
          <td>Saec. XX</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:body
let $ln := $doc//tei:person
let $dc := ( "14" , "15", "16", "17", "18", "19" )
return element tbody {
element tr {
element td {
	"Omnes"
} ,
for $omn in 1 to 6
return element td { 
 count(croala:saec($dc[$omn]))
} 
},

element tr {
element td {
	"Poesis"
} ,
for $omn in 1 to 6
return element td { 
 count(croala:saec($dc[$omn])[tei:occupation[@code="tax.poesis"]])
} 
},

element tr {
element td {
	"Prosa"
} ,
for $omn in 1 to 6
return element td { 
 count(croala:saec($dc[$omn])[tei:occupation[@code="tax.prosa"]])
} 

},

element tr {
element td {
	"Poesis et prosa"
} ,
for $omn in 1 to 6
return element td { 
 count(croala:saec($dc[$omn])[tei:occupation[@code="tax.prosa"] and tei:occupation[@code="tax.poesis"]])
} 
},

element tr {
element td {
	"Non notati"
} ,
for $omn in 1 to 6
return element td { 
 count(croala:saec($dc[$omn])[not(tei:occupation[@code="tax.prosa"])][not(tei:occupation[@code="tax.poesis"])])
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
