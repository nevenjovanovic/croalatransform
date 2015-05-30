import module namespace rest = "http://exquery.org/ns/restxq";

(: find number of particular words in authors in a db, return count using fulltext index, and percentage of total words :)

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

declare function croala:wordsauct ($db) {

let $rijeci := element rijeci { 
 for $auctores in distinct-values(collection($db)/*:TEI/descendant::*:titleStmt/*:author/@key)
  let $verba := collection($db)/*:TEI[descendant::*:titleStmt/*:author/@key=$auctores]//*:text[not(descendant::*:text)]
  let $count := sum(
    for $d in $verba return ft:count($d//*[text() contains text ".*" using wildcards])
  )
    for $t in ("scilicet", "videlicet", "uidelicet" , "quippe", "nempe", "nimirum", "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero")
    let $term := ft:tokenize($t)
    let $entry := sum(for $e in $verba return ft:count($e//*[text() contains text {$term}]))
return if ($entry) then element tr { 
  element td { 
    attribute class { $db },
    $db } ,
    element td { 
    element a {
      attribute href { "http://solr.ffzg.hr/basex/auctor/" || $auctores } ,
    $auctores
  }
  },
  element td { $term } ,
  element td { $entry },
  element td { round($entry div $count * 100000) div 100000 } ,
  element td { $count } }
else element tr { 
  element td { 
    attribute class { $db },
    $db } ,
    element td { 
    element a {
      attribute href { "http://solr.ffzg.hr/basex/auctor/" || $auctores } ,
    $auctores
  }
  },
  element td { $term } ,
  element td { "0" },
  element td { "0" } ,
  element td { $count } }
}
for $rr in $rijeci/tr
order by $rr/td[3] , number($rr/td[5]) descending , number($rr/td[6]) descending
return $rr

} ;

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/verbaauctores/{$db}")
  %rest:GET
  function page:verbaqauct1($db)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verba quaedam apud auctores</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: verba quaedam apud auctores</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus verba quaedam apud auctores collectionis {$db}. Verba sunt haec: { string-join(croala:quaedam(), ', ')}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>DB</td>
  <td>Auctor</td>
  <td>Verbum</td>
  <td>Quot occurrentia</td>
  <td>Ratio occurrentium et omnium</td>
  <td>Quot omnia</td>
  </tr>
  </thead>
  <tbody>
    { croala:wordsauct($db) }
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