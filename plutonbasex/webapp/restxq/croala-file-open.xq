import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: open file from a db :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";



(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("documentum/{$db}/{$filename}")
  %rest:GET
  function page:opendoc(
    $db,$filename)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa: documentum</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="description" content="A RestXQ function to open a document in an XML database and display text nodes. Part of the Croatica et Tyrolensia project."/>
<meta name="keywords" content="XQuery,RestXQ,BaseX,XML,Neo-Latin,Digital Humanities,Croatian Latin Writers, hrvatski latinisti, Croatiae auctores Latini"/>
<meta name="author" content="Neven Jovanović, Odsjek za klasičnu filologiju, Filozofski fakultet Sveučilišta u Zagrebu"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
</head>

<body>
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa: documentum</h1>

<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }. Nodus {$filename} in collectione {$db}.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">
<h2><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> Documentum {$filename} in db {$db}</h2>

<hr/>
<blockquote class="croalatext">
    { croala:openfile($db,$filename) }
</blockquote>
     <p/>
     </div>
<hr/>

{ croala:footerserver() }
</div>
</body>
</html>
};

return
