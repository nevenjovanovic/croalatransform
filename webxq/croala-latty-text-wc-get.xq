import module namespace rest = "http://exquery.org/ns/restxq";

(: show word count in respective text db, with links to philologic :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

declare function croala:solraddr ($auct) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=HEREDB&amp;filename=HEREGENUS"
return replace($link,"HEREDB",$auct)
 };

declare function croala:wc ($collection) { 
for $idx in 
for $dc in collection($collection)//*:text[not(ancestor::*:text)]
let $name := db:path($dc)
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td { 
element a { 
  attribute href { replace(croala:solraddr($collection),"HEREGENUS", $name)},
  $name
}
},
element td { attribute class {"clausula"} , $wc }
}

return element tbody { 
element tr { sum($idx/td[2]) } , 
$idx }

};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/numerus/{$auct}")
  %rest:GET
  function page:quotverba(
    $auct)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: quot verba</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: quot verba?</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectione {$auct}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>Textus</td>
  <td>Verborum numerus</td>
  </tr></thead>
    { croala:wc($auct) }
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

