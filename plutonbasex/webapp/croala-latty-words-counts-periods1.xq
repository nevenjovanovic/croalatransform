import module namespace rest = "http://exquery.org/ns/restxq";

(: find number of particular words in periods in two db's, return count using fulltext index, and percentage of total words :)

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


declare function croala:periodcount () {

(: find certain words in certain period :)

let $rijeci := element rijeci { 
for $db in ("latty" , "croala")
 for $periods in distinct-values(collection($db)/descendant::*:profileDesc[1]/*:creation/*:date/@period)
  let $verba := collection($db)/*:TEI[descendant::*:profileDesc[1]/*:creation/*:date/@period=$periods]//*:text[not(descendant::*:text)]
  let $count := sum(
    for $d in $verba return ft:count($d//*[text() contains text ".*" using wildcards])
  )
    for $t in croala:quaedam()
    let $term := ft:tokenize($t)
    let $entry := sum(for $e in $verba return ft:count($e//*[text() contains text {$term}]))
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
    element td { 
    element a {
      attribute href { "http://solr.ffzg.hr/basex/" || $db || "/" || $periods || "/docs" } ,
    $periods
  }
  },
  element td { $term } ,
  element td { $entry },
  element td { round($entry div $count * 100000) div 100000 } ,
  element td { $count } }
else()
}
for $rr in $rijeci/tr
order by $rr/td[3] , $rr/td[2] , number($rr/td[5]) descending , number($rr/td[6]) descending
return $rr

} ;

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/verba/aetates")
  %rest:GET
  function page:verbaetates1()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verba quaedam in periodis</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: verba quaedam in aetatibus</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus verba quaedam in aetatibus in collectionibus LatTy et CroALa. Verba sunt haec: { string-join(croala:quaedam(), ', ')}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>DB</td>
  <td>Aetas</td>
  <td>Verbum</td>
  <td>Quot</td>
  <td>Ratio verbi in omnibus</td>
  <td>Quot omnia</td>
  </tr>
  </thead>
  <tbody>
    { croala:periodcount() }
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