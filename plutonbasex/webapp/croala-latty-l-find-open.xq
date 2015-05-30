import module namespace rest = "http://exquery.org/ns/restxq";

(: return l in db containing a word :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function croala:versus ($db,$qverb) { for $i in collection($db)//*:l[ft:tokenize(.)[last()] contains text {$qverb} using fuzzy]
let $nod := db:node-pre($i/(parent::*:lg|parent::*:div|parent::*:sp))
order by ft:tokenize($i)[last()] , ft:tokenize($i)[last() - 1]
return element tr { 
element td { element a { 
attribute href {"/basex/node/" || $db || "/" || $nod } ,
"Nodus " || $nod } }, 
element td { $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])] } } };

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("versus/{$db}/{$qverb}")
  %rest:GET
  function page:findvers(
    $db,$qverb)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: div</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: div</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaero {$qverb} in versibus collectionis {$db}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<h2>Versus qui finiunt in <em>{$qverb}</em> (vel sim.) sunt {count(croala:versus($db,$qverb))} in {$db}.</h2>
<blockquote>
<table>
    { croala:versus($db,$qverb)
 }</table>
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

