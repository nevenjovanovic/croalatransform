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

declare function croala:dokbrj ($collection) {
  count(collection($collection)//*:TEI)
};

declare function croala:tkstbrj ($collection) {
  count(collection($collection)//*:TEI//*:profileDesc/*:creation/*:date[1][@period])
};

declare function croala:rijecbrj ($collection) {
  format-number(count(for $i in collection($collection)//*:text[not(descendant::*:text)] return ft:tokenize($i)), '#,##0')
};

declare function croala:solraddr ($db) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=HEREDB"
return element a {
  attribute href { replace($link,"HEREDB",$db) },
  $db
}
 };

declare %rest:GET %rest:POST %rest:path("croala-latty-c")
function page:croala-latty-count() { 

(: How many texts currently in CroALa and LatTy? :)
(: Present result as a HTML page :)



(: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: quot textus?</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: quot textus?</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>

<blockquote>
<p>Hodie in { croala:solraddr("croala") } sunt documenta { croala:dokbrj("croala")}, verborum autem { croala:rijecbrj("croala") }. In documentis sunt textus { croala:tkstbrj("croala")}.</p>
<p>Hodie in { croala:solraddr("latty") } sunt documenta { croala:dokbrj("latty")}, verborum autem { croala:rijecbrj("latty") }. In documentis sunt textus { croala:tkstbrj("latty")}.</p>


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
