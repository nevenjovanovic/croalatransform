import module namespace rest = "http://exquery.org/ns/restxq";

(: return word count of particular words in two db's in prose / p and poetry / l :)

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

declare function croala:round2($a,$b) {
  round($a div $b * 10000) div 10000
};

declare function croala:prospoecount () {
let $rijeci := element r {
for $db in ("latty","croala")
let $textspp := 
  for $doc in collection($db)/*:TEI//*:text[not(descendant::*:text)]
  let $count := sum(
    for $d in $doc return ft:count($d//*:p[not(descendant::*:p) and text() contains text ".*" using wildcards])
  )
  let $countl := sum (
    
    for $d in $doc return ft:count($d//*:l[not(descendant::*:l) and text() contains text ".*" using wildcards])
  )
  
  for $t in croala:quaedam()
    let $term := ft:tokenize($t)
    let $entry := sum(for $e in $doc return ft:count($e//*:p[not(descendant::*:p) and text() contains text {$term}]))
    let $entryl := sum(for $e in $doc return ft:count($e//*:l[not(descendant::*:l) and text() contains text {$term}]))
  
  return element tr {
    element td { 
    attribute class { $db } , $db },
   element td { 
  element a { 
  attribute href {"http://solr.ffzg.hr/basex/node/" || $db || "/" || db:node-pre($doc) } ,
  db:path($doc) }
},
element td { count($doc) } ,
element td { $term } ,
element td { $entry },
element td { if ($count > 0) then croala:round2($entry, $count) else 0 } ,
element td { $count } ,
element td { $entryl },
element td { if ($countl > 0) then croala:round2($entryl, $countl) else 0 } ,
element td { $countl } }

return $textspp
}
return for $t in $rijeci//tr order by $t/td[4] , $t/td[6] descending , $t/td[9] descending 
  return $t

};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/verba/prospoe")
  %rest:GET
  function page:verbaprospoe1()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verba quaedam in periodis</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: verba in prosa et poesi</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus verba quaedam in aetatibus in collectionibus LatTy et CroALa. Verba sunt haec: { string-join(croala:quaedam(), ', ')}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>DB</td>
  <td>Documentum</td>
  <td>Quot textus in doc</td>
  <td>Verbum</td>
  <td>Quot in prosa</td>
  <td>Ratio verbi in prosa</td>
  <td>Quot omnia in prosa</td>
  <td>Quot in poeticis</td>
  <td>Ratio verbi in poeticis</td>
  <td>Quot omnia poetica</td>
  </tr>
  </thead>
  <tbody>
    { croala:prospoecount() }
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