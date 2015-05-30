import module namespace rest = "http://exquery.org/ns/restxq";

(: show word count in both db's, with links to philologic :)

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
 

declare function croala:wc2 () { 
let $sve := element tbody { 
for $collection in ("croala", "latty")
for $dc in collection($collection)//*:text[not(ancestor::*:text)]
let $name := db:path($dc)
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td {
  attribute class { $collection },
  $collection
},
element td { 
element a { 
  attribute href { replace(croala:solraddr($collection),"HEREGENUS", $name)},
  $name
}
},
element td { attribute class {"clausula"} , $wc },
element td {
  element a {
    attribute href { "http://solr.ffzg.hr/basex/node/" || $collection || "/" || db:node-pre($dc) } ,
    db:path($dc)
  }
}
}
}
let $sbody := $sve
let $sum := for $s in $sve/tr/td[3] return $s
let $quot := 
for $q in $sve/tr
let $n := $q/td[3]
let $group := 
  if ($n > 100000) then "Verb. 100,000+"
  else if ($n < 100000 and $n >= 10000) then "Verb. 10,000-100,000"
  else if ($n < 10000 and $n >= 1000 ) then "Verb. 1,000-10,000"
  else if ($n < 1000 and $n >= 500) then "Verb. 500-1000"
  else if ($n < 500 and $n >= 100) then "Verb. 100-500"
  else if ($n < 100 and $n >= 50) then "Verb. 50-100"
  else if ($n < 50) then "Verb. 1-50"
  else()
group by $group
return element tr { element td {} , element td { $group } , element td { 
attribute class {"clausula"} , count($q) } }
let $tot := sum($sum)
let $max := max($sum)
let $min := min($sum)
return element table { element thead { 
element tr { element td {} , element td { "Verborum in toto" } , element td {
  attribute class {"clausula"} , format-integer(xs:integer($tot), "#,##0") } },
element tr { element td {} , element td { "Documentum longissimum" } , element td { 
attribute class {"clausula"} ,format-integer(xs:integer($max), "#,##0") } },
element tr { element td {} , element td { "Documentum brevissimum" } , element td { 
attribute class {"clausula"} , $min } },
$quot ,
element tr { element td {"DB"} ,
element td {"Textus"} , 
element td { "Verborum numerus"} ,
element td { "Nodus in DB"}} },
$sbody }
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/numerus/croalalatty")
  %rest:GET
  function page:quotverba2()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: quot in utraque</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: quot in utraque?</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaeruntur verborum numeri in collectionibus CroALa et Latty.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>

    { croala:wc2() }

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

