import module namespace rest = "http://exquery.org/ns/restxq";
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

declare function croala:generatypi ($collection,$gentyp) { 
for $p in collection($collection)//*:profileDesc
for $genre in $p/*:creation/*:date/@period
for $pergenre in $p/*:textClass/*:keywords[@scheme=$gentyp]/*:term

group by $genre
order by $genre
return element table { 
element thead {
element tr {
  element td { $genre } ,
  element td { "Quot" }
}
} , 
element tbody {
 for $v in distinct-values($pergenre)
 let $freq := count(index-of($pergenre, $v))
 order by $v
return element tr {
    element td { $v }, 
    element td { $freq }
}
}
  }
};


(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/{$coll}/{$gen}")
  %rest:GET
  function page:genper2(
    $coll,$gen) { 

(: Report a list of authors currently in CroALa :)
(: Present result as a HTML page :)


(: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: genera per saecula</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: genera per saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<blockquote>
    { croala:generatypi($coll,$gen) }
    
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

