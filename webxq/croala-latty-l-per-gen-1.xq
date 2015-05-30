import module namespace rest = "http://exquery.org/ns/restxq";

(: find docs with verses in periods :)

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
declare function croala:vaet ($aetas) {
  for $coll in ("latty", "croala")
let $versus := for $i in collection($coll)/*:TEI[descendant::*:profileDesc[1]/*:creation/*:date[@period=$aetas] and descendant::*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]]
return $i
let $oo := distinct-values(for $f in $versus return db:path($f))
return if ($versus) then element tr { 
attribute class { $coll } ,
element td { $coll },
element td { $aetas } ,
element td { count($versus//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]) } ,
element td { count($oo)} ,
element td {  string-join($oo, ", ") }
 }
  else()
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/versus/{$aetas}")
  %rest:GET
  function page:versusaetates($aetas)
{
  (: HTML template starts here :)

<html>
<head><title>LatTy: versus in aetate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>LatTy: versus in aetate</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectionibus latty et croala, versus in aetate {$aetas}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
<table>
<thead><tr>
<td>Collectio</td>
<td>Aetas</td>
<td>Versus</td>
<td>Documenta</td>
<td>Tituli</td></tr></thead>
<tbody>
 { croala:vaet($aetas) }</tbody>
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

