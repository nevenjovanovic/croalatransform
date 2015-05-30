import module namespace rest = "http://exquery.org/ns/restxq";

(: find all documents in certain periods in db :)

declare namespace page = 'http://basex.org/examples/web-page';

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare function croala:fperiod ($db,$period) {

(: find all texts in certain period :)
let $docsper := 
  for $doc in collection($db)/*:TEI[descendant::*:profileDesc[1]/*:creation/*:date[1]/@period=$period]
  order by db:path($doc)
  return element li { 
  element a { 
  attribute href {"http://solr.ffzg.hr/basex/node/" || $db || "/" || db:node-pre($doc) } ,
  db:path($doc) }
}
return element tr { 
element td { 
attribute class { $db } , $db } ,
element td { count($docsper) } ,
element td { $docsper } }

} ;

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/{$db}/{$period}/docs")
  %rest:GET
  function page:periodidoc($db,$period)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: documenta in periodis</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: documenta in periodis</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus documenta in periodis in collectione {$db}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
  <table>
  <thead>
  <tr>
  <td>DB</td>
  <td>Quot</td>
  <td>Documenta</td>
  </tr>
  </thead>
  <tbody>
    { croala:fperiod($db,$period) }
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