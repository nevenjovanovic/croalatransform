import module namespace rest = "http://exquery.org/ns/restxq";

(: sort by periods; return genres, number and names of document; translate German genre names to Latin :)

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

declare function croala:periodgenredoc () {
  for $docs in  (collection("croala")|collection("latty"))//*:profileDesc/*:creation/*:date[@period]
let $id := db:path($docs)
let $idlink := element a { attribute href {"http://solr.ffzg.hr/basex/" || db:name($docs) || "/opendoc/" || $id } , $id }
let $genre := string-join(for $g in $docs/ancestor::*:profileDesc/*:textClass/*:keywords[@scheme="genre"]/*:term return $g, ' ')
let $genretr := if (map:contains($genrelat,$genre)) then map:get($genrelat,$genre) else $genre
let $per := $docs/@period
let $dbs := for $d in $docs return db:name($d)
  group by $per , $genretr
  order by $per , $genretr
return element tr {
  element td { 
  attribute class { $dbs[1] } ,
  distinct-values($dbs) },
  element td { data($per) },
  element td { data($genretr) } ,
  element td { count($id) } ,
  element td { $idlink }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("croalalatty/periodgenre")
  %rest:GET
  function page:pgenre1()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: periodi et genera</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: periodi et genera</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaeruntur periodi et genera in collectionibus CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<p>Ut documenta in LatTy invenias, utere clavium combinatione Ctrl + F.</p>
<hr/>
<blockquote>
<table>
<thead>
<tr>
<td>DB</td>
<td>Periodus</td>
<td>Genera</td>
<td>Quot documenta</td>
<td>Documenta</td>
</tr>
</thead>
<tbody>
    { croala:periodgenredoc() }
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

