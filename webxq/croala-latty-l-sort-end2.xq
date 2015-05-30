(: sort verses l in db by two final words, return html with links to db nodes and croala :)
import module namespace rest = "http://exquery.org/ns/restxq";

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function croala:solraddr ($auct) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=croala&amp;word=HEREWDSSS"
return replace($link,"HEREWDSSS",$auct)
 };

declare function croala:llist ($db) {
let $claus := element claus { for $v in 
for $i in collection($db)//*:l[not(ancestor-or-self::*[@xml:lang])]
return element l {
  attribute nodeid { db:node-pre($i) } ,
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])]
}
let $lv := for $a in ft:tokenize($v) return replace(replace($a, '[\W\d]', ''),'v','u')
order by $lv[last()], $lv[last() - 1]
return element tr { 
element td {
element a { attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($v/@nodeid) } , "Nodus " || data($v/@nodeid) } } ,
element td {
  attribute class {"clausula"} ,
$lv[last() - 2] || " " , element b { $lv[last() - 1] || " " || $lv[last()] } } ,
element td { element a { attribute href { croala:solraddr($lv[last()]) } , "Quaere in CroALa" } } }
}

return element table { 
element thead {
  element tr { 
  element td { "Versus: " || count($claus/tr) } , 
  element td { "Textus"} ,
  element td { "CroALa"} } 
} , 
element tbody { 
$claus } }
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("clausulae2/{$db}")
  %rest:GET
  function page:clausulae(
    $db)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: clausulae</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: clausulae</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Clausulae in versibus collectionis {$db}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<h2>De fine versus Latini in collectione {$db}.</h2>
<blockquote>
    { croala:llist($db)
 }
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

