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

declare function croala:broji($bib) {
  count(collection($bib)//(*:person|*:org))
};

declare function croala:tkstbroji($bib, $vrst) {
  count(collection($bib)//*:titleStmt/*:author[@key=$vrst])
};

declare function croala:solraddr ($db) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=HEREDB&amp;filename=REPLACENAME"
return replace($link,"HEREDB",$db)
 };

declare function croala:joinbib () { 
for $ent in distinct-values(collection("croala")//*:titleStmt/*:author/@key)
order by $ent collation "?lang=hr"
return element tr {
element td { if (starts-with($ent, "#")) then $ent
else
data(collection("croalabib")//*[@xml:id=$ent]/*[1]) } , 
element td { if (starts-with($ent, "#")) then $ent
else
element a { attribute href { concat("auctor/", $ent )} ,
$ent }
} , 
element td { 
for $t in collection("croala")//*:titleStmt/*:author[@key=$ent]/ancestor::*:fileDesc/@xml:id
let $link := croala:solraddr("croala")
return element a { attribute href { replace ($link,"REPLACENAME",$t)}, data($t)}
 }
 }
};

declare function croala:list() {
for $ent in distinct-values(collection("latty")//*:titleStmt/*:author/@key)
order by $ent collation "?lang=de"
return element tr {
element td { if (starts-with($ent, "#")) then $ent
else
data(collection("tei-tyrolis")//*[@xml:id=$ent]/*[1])
 },
element td { 
if (starts-with($ent, "#")) then $ent
else
element a { attribute href { concat("auctor/", $ent )} ,
$ent }
 },
element td { 
for $t in collection("latty")//*:titleStmt/*:author[@key=$ent]/ancestor::*:fileDesc/@xml:id
let $link := croala:solraddr("latty")
return element a { attribute href { replace ($link,"REPLACENAME",$t)}, data($t)}}
}
};

declare %rest:GET %rest:POST %rest:path("croala-cat-a1")
function page:croala-catalog1() { 

(: Report a list of authors currently in CroALa :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: catalogus auctorum</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: catalogus auctorum</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
<p>In CroALa auctores { count(croala:joinbib())}, sine nomine { croala:tkstbroji("croala", "#anonymus") }, alieni { croala:tkstbroji("croala", "#alienus") }, ignoti { croala:tkstbroji("croala", "#ignotus") }, varii in eodem documento { croala:tkstbroji("croala", "#varii") }. Omnes in indiculo croalabib numero sunt <b>{croala:broji("croalabib")}</b>.</p>
<p>In LatTy auctores { count(croala:list())}, sine nomine { croala:tkstbroji("latty", "#anonymus") }. Omnes in indiculo tei-tyrolis numero sunt <b>{croala:broji("tei-tyrolis")}</b>.</p>
<table>
<thead>
<tr>
<td>LatTy auctor</td>
<td>Vita</td>
<td>Textus</td>
</tr></thead>
<tbody>{ croala:list() }</tbody>
</table>
<table>
    
    <thead>
      <tr>
      <td>CroALa auctor</td>
<td>Vita</td>
<td>Textus</td>
      </tr>
    </thead>
    <tbody>
    { croala:joinbib () }
    </tbody>
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
