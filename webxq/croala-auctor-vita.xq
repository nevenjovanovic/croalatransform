import module namespace rest = "http://exquery.org/ns/restxq";

(: take an ID and show the prosopographic record in respective bib db :)

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

declare function croala:rec($prosopid) {
  for $r in (collection("croalabib")|collection("tei-tyrolis"))//*[@xml:id=$prosopid]
  return $r
   };

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/auctor/{$auct}")
  %rest:GET
  function page:auctor(
    $auct)
{
  (: HTML template starts here :)

<html>
<head><title>CroalaBib &amp; LatTy: de auctoribus</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib &amp; LatTy: de auctoribus</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>

<blockquote>
  <response>
    { croala:rec($auct) }
  </response>
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
