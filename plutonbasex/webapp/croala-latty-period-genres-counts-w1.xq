import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: sort by periods; return count by genres and by documents; translate German genre names to Latin :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";

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
declare function croala:pergenrcount2 () {
for $db in ("croala", "latty")
return element table {
  attribute id {$db},
  element tbody {
    element thead {
      element tr {
        element td { "DB"},
        element td { "Periodus"},
        element td {"Quot genera"} ,
        element td { "Genera et documenta"},
        element td { "Quot documenta"},
        element td { "Quae documenta"}
      }
    },
for $docs in  collection($db)//*:profileDesc/*:creation/*:date[@period]
let $id := db:path($docs)
let $idlink := element a { attribute href {"http://solr.ffzg.hr/basex/" || db:name($docs) || "/opendoc/" || $id } , $id }
let $genre := for $g in $docs/ancestor::*:profileDesc/*:textClass/*:keywords[@scheme="genre"]/*:term return $g
let $genretr := for $g in $genre return if (map:contains($genrelat,$g)) then map:get($genrelat,$g) else $g
let $per := $docs/@period
  group by $per
  order by $per
return element tr {
  element td { 
  attribute class { distinct-values($db) },
  distinct-values($db) },
  element td { data($per) },
  element td { count(distinct-values(data($genretr))) } ,
  element td { 
  string-join(
    for $g in distinct-values($genretr)
  return $g || ": "  || count($genretr[.=$g]), "; ") } ,
  element td { count($id) } ,
  element td { $idlink }
}
}
}
};

declare function croala:pagepergen () {
  
  <html>
<head><title>CroALa &amp; LatTy: periodi et genera 1</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: periodi et genera 1</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaeruntur periodi et genera in collectionibus CroALa et LatTy.</p>
<ul>
<li><a href="#croala">CroALa</a></li>
<li><a href="#latty">LatTy</a></li>
</ul>
<hr/>
<blockquote>

{ croala:pergenrcount2() }

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

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/periodgenre/croalalatty")
  %rest:GET
  function page:periodgenre2()
{
 croala:pagepergen()
};
return
