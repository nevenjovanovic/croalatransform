import module namespace rest = "http://exquery.org/ns/restxq";

(: count verses total, count verses in documents, in croala and latty :)

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

(: count totals of verses :)
declare function croala:vomn () {
  for $coll in ("latty", "croala")
let $doccount := count(collection($coll)/*)
let $docs := collection($coll)/*:TEI[descendant::*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]]
let $docverscount := count($docs)
let $verscount := format-integer(count($docs//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]), '###,##0')
let $docvcount := 
  for $document in $docs
  order by $document/descendant::*:profileDesc[1]/*:creation/*:date[1]/@period , db:path($document)
  return element tr { 
    element td {},
  element td {
    db:path($document) } ,
  element td {
    attribute class { "clausula"},
    count($document//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)])
  }
}
return element table {
  element thead {
    element tr {
      element td { $coll } ,
      element td { $docverscount || "/" || $doccount } ,
      element td { 
          attribute class { "clausula"},
          $verscount }
    }
  },
  element tbody {
    $docvcount
  }
}

};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/versus/omnes")
  %rest:GET
  function page:versusomnes()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: versus per aetates</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: versus per aetates</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectionibus CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>

 { croala:vomn() }
 
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

