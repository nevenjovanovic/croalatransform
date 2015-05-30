import module namespace rest = "http://exquery.org/ns/restxq";

(: return links to all nodes with certain ttr in two db's :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function croala:ttr2($v) {
for $d in collection("cl-idx")//d
where $d/ttr[.=$v]
order by $d/aet
return element tr { 
  element td {
    attribute class { data($d/db) } ,
    $d/db } ,
 element td {
 element a {
  attribute href { "http://solr.ffzg.hr/basex/node/" || data($d/db) || "/" || data($d/node) } , data($d/node)
} },
 element td {
  $d/path } ,
 element td {
  $d/aet },
 element td {
  $d/gen }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/ttrdiv2/{$v}")
  %rest:GET
  function page:ttrdiv2($v)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: div et TTR</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: div et TTR</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus TTR (ratio lemmatum et verborum) {$v} in elementis div collectionum CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
<table>
<thead>
<tr>
<td>DB</td>
<td>Nodus</td>
<td>Documentum</td>
<td>Aetas</td>
<td>Genus</td>
</tr></thead>
<tbody>{ croala:ttr2($v) }</tbody></table></blockquote>


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