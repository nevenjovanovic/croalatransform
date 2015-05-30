import module namespace rest = "http://exquery.org/ns/restxq";

(: in both db's find docs belonging to genres :)

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

declare variable $genrelat as map(*) := map {
 "Brief": "prosa oratio - epistula",
 "Dichtung": "poesis",
 "Epik" : "poesis - epica",
 "Gelegenheitsdichtung": "poesis - sylva",
 "Lehrgedicht" : "poesis - didactica",
 "Geschichtsschreibung": "prosa oratio - historia",
 "Theater": "poesis - drama"
};

declare function croala:dbgenera () {
  (: return number and names of documents in certain genres; translate German genre names to Latin :)

let $genper := element genper { 
for $coll in ("latty" , "croala")
let $genre := distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term)
for $b in $genre
let $docs := for $i in collection($coll)/*:TEI[descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term[.=$b]]
return $i

return element tr { 
element td {
attribute class { $coll } ,
$coll
},
element td { attribute class { "genre" } , if (map:contains($genrelat,$b)) then map:get($genrelat,$b) else $b } ,
element td { count( $docs ) } ,
element td { for $d in $docs return element a { 
attribute href { "http://solr.ffzg.hr/basex/" || db:name($d) || "/opendoc/" || db:path($d) } ,
db:path($d) }
 }
}
 }

return element table { 
element thead { 
element tr {
  element td { "DB"},
  element td { "Genus"},
  element td { "Quot"},
  element td { "Documenta"}
} },
element tbody {
for $g in $genper//*:tr
order by $g/*:td[@class='genre']
return $g
 }
}
};


(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/genera/croalalatty")
  %rest:GET
  function page:generaambo()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: genera synoptice</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: genera synoptice</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectionibus latty et croala, genera et documenta.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>

 { croala:dbgenera() }
 
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

