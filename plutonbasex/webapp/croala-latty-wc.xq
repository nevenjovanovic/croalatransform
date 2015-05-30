import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";


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
  %rest:path("croalalatty")
  %rest:GET
  function page:cllt()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: div</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
</head>

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa &amp; LatTy: verborum numeri</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
	<td>DB</td>
	<td>Textus</td>
	<td>Verborum numerus</td></tr>
	</thead>
	<tbody>
    { 
    for $db in ("croala", "latty")
return element tr { 
element td {
  attribute class { $db },
  $db
},
element td { count(collection($db)//*:text[not(descendant::*:text)]) } , 
element td { attribute class {"clausula"} , croala:wcsve($db) } } , 
croala:wc() 
     }
     </tbody>
     </table>
     </div>
</blockquote>
     <p/>
     </div>
<hr/>
<footer class="footer">
<div class="container">
<h1 class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> <a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et</a> Tyrolensia</h1>
<div class="row">
<div  class="col-md-3">
<a href="http://www.ukf.hr/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/znanjepomocen.jpg?cache="/></a></div> 
<div  class="col-md-6">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="http://www.ffzg.unizg.hr/wp-content/themes/ffzg3/images/logo.gif"/> Filozofski fakultet</a> Sveučilišta u Zagrebu</p> 
<p class="text-center">Ludwig Boltzmann <a href="http://neolatin.lbg.ac.at/">Institut für Neulateinische Studien, Innsbruck</a> <img src="http://lbicr.lbg.ac.at/files/sites/lbicr/images/bildlogo_farbe_weiss.jpg" width="60"/></p></div>
<div  class="col-md-3"><p  class="text-right"><a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/tirollogo.png?cache="/></a></p></div></div>
</div>
</footer>
</div>
</body>
</html>
};

return




