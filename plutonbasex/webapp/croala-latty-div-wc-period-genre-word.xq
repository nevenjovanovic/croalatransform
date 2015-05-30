import module namespace rest = "http://exquery.org/ns/restxq";

(: show word count in respective divs for both db's, with links to db nodes :)
(: choose word count range and period and genre and word in div :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare variable $genrelat as map(*) := map {
 "Brief": "prosa oratio - epistula",
 "Dichtung": "poesis",
 "Dichtung Gelegenheitsdichtung": "poesis poesis - sylva",
 "Dichtung Lehrgedicht": "poesis poesis - didactica",
 "Dichtung Epik": "poesis poesis - epica",
 "Epik" : "poesis - epica",
 "Gelegenheitsdichtung": "poesis - sylva",
 "Lehrgedicht" : "poesis - didactica",
 "Geschichtsschreibung": "prosa oratio - historia",
 "Theater": "poesis - drama"
};

declare function croala:wc5 ($period,$lo,$hi,$word) { 
let $divs := element tbody { 

for $collection in ("croala" , "latty")
for $i in collection($collection)//*:text[not(ancestor::*:text) and ancestor::*:TEI/descendant::*:profileDesc[1]/*:creation/*:date[1][contains(@period,$period)]]
for $dc in $i//*:div[. contains text {$word} and not(descendant::*:div)]
let $name := db:path($dc)
let $wc := count(ft:tokenize($dc))
where $wc >= $lo and $wc <= $hi
order by $wc descending
return element tr { 
element td {
  attribute class { $collection },
  $collection
},
element td { 
element a { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $collection || "/" || db:node-pre($dc) },
  $name || ":" || db:node-pre($dc)
}
},
element td { attribute class {"clausula"} , $wc }
}

}


let $divcount := count($divs/tr)
let $dbcroalacount := count($divs/tr/td[1][.="croala"])
let $dblattycount := count($divs/tr/td[1][.="latty"])
let $divmax := max($divs/tr/td[3])
let $divmin := min($divs/tr/td[3])
return element blockquote { 
element p { "Elementa div numero sunt: " || $divcount || "." },
element p { "In LatTy sunt div numero: " || $dblattycount || "." },
element p { "In CroALa sunt div numero: " || $dbcroalacount || "." },
if ($divmax) then element p { "Longissimum div verba habet: " || $divmax || "." } else(),
if ($divmax) then element p { "Brevissimum div verba habet: " || $divmin || "." } else(),
element table {
element thead {
element tr {
  element td { "DB"},
  element td { "Textus: div"},
  element td { "Quot verba"}
}},
 $divs }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/numdiv/{$period}/{$lo}/{$hi}/{$word}")
  %rest:GET
  function page:quotverbadiv5($period,$lo,$hi,$word)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verbum in div in genere in periodo in numero</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../../../../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../../../../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: verbum, div, genus, periodus, comprehensio</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaeritur in collectionibus CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
    { croala:wc5($period,$lo,$hi,$word) }
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

