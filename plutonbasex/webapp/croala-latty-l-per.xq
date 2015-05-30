import module namespace rest = "http://exquery.org/ns/restxq";

(: count verses in periods in croala and latty :)

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

(: count verses in periods :)
declare function croala:vp () {
  for $coll in ("latty", "croala")
let $doccount := count(collection($coll)/*)
for $period in distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:creation/*:date/@period)
let $i := collection($coll)/*[descendant::*:profileDesc[1]/*:creation/*:date/@period=$period]//*:text[not(descendant::*:text)]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
where count($i) > 0
order by $period
return element tr { 
element td { 
element a { 
attribute href { "/basex/versus/" || $period } ,
$period
}
 } ,
 element td { 
 attribute class { $coll } ,
 $coll } ,
element td { count($i) }
 }
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/versus/aetates")
  %rest:GET
  function page:versusaetates()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: versus per aetates</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: versus per aetates</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectionibus CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
<table>
<thead>
<tr>
<td>Aetas</td>
<td>Collectio</td>
<td>Versus</td>
</tr>
</thead>
<tbody>
 { croala:vp() }</tbody>
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

