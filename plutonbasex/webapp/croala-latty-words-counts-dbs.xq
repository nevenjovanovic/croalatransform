import module namespace rest = "http://exquery.org/ns/restxq";

(: find number of particular words in two db's, return count using fulltext index, and percentage of total words:)

declare namespace page = 'http://basex.org/examples/web-page';

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function croala:quaedam () {
  let $a := ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
  return $a
};

declare function croala:wordsdb () {
let $rijeci := element rijeci { for $db in ("croala", "latty")
let $count := ft:count(collection($db)//*:text[not(descendant::*:text)]//*[text() contains text ".*" using wildcards])
for $t in croala:quaedam()
let $term := ft:tokenize($t)
let $entry := ft:tokens($db, $term)[. = $term][1]
let $entrycount := number($entry/@count)
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
  element td { $entry/text() },
  element td { 
  attribute class {"clausula" } , $entrycount },
  element td { round($entrycount div $count * 100000) div 100000 }  ,
  element td { attribute class { "clausula"} , format-integer($count, '###,##0') } }
else()
}
for $rr in $rijeci/tr
order by $rr/td[2]
return $rr
} ;

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/verba/quaedam")
  %rest:GET
  function page:verbaquaedam()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verba quaedam</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: verba quaedam</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus verba quaedam in textibus collectionum CroALa et LatTy. Verba sunt haec: { string-join(croala:quaedam(), ', ')}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>DB</td>
  <td>Verbum</td>
  <td>Quot occurrentia</td>
  <td>Ratio occurrentium et omnium</td>
  <td>Omnia</td>
  </tr></thead>
  <tbody>
    { croala:wordsdb() }
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