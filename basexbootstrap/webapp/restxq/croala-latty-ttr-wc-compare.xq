import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: show word counts and ttrs form index db for a collection :)

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
  %rest:path("/{$coll}/{$db}")
  %rest:GET
  function page:ttrwc03(
    $db, $coll)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: TTR in textibus</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="/basex/static/dist/js/jquery.tablesorter.js"></script>
</head>

<body>
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa &amp; LatTy: <small>TTR in {$db}</small></h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus de collectione {$db}.</p>
<p>Functio nominatur: <tt>{rest:uri()}</tt>.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Textus</td>
  <td>Aetas</td>
  <td>Verborum numerus</td>
  <td>TTR</td>
  </tr></thead>
  <tbody>
    { croala:ttrwc2 ($coll, $db) }
    </tbody>
  </table>
</div>
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footer() }
</div>
{ croala:tablescript () }
</body>
</html>
};

return

