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


(: round a number :)
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

(: list word count in divs, type count, type-token ratio :)
declare function croala:divttr ($collection) { for $i in collection($collection)//*:div[not(descendant::*:div)]
let $wl := ft:tokenize($i)
let $wc := count($wl)
let $typ := distinct-values($wl)
let $ttr := if ($wc ne 0) then croala:round2(count($typ), $wc)
else "na"
order by $ttr descending
return element tr { 
element td { 
attribute class {"name"},
db:path($i) } ,
element td { 
attribute class {"tok"},
$wc } ,
element td { 
attribute class {"typ"},
count($typ) },
element td { 
attribute class {"ttr"},
$ttr }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/ttrdiv/{$auct}")
  %rest:GET
  function page:ttrdiv(
    $auct)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: typica et occurrentia</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: typica et occurentia</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus verba typica et occurrentia in sectionibus collectionis {$auct}. Inventae sunt sectiones { count(croala:divttr($auct)) }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>Sectiones textus</td>
  <td>Quot occurrentia</td>
  <td>Quot typica</td>
  <td>Ratio typicorum et occurrentium</td>
  </tr></thead>
  <tbody>
    { croala:divttr($auct) }
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
