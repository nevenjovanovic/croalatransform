import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

(: filter ttrs in croala + latty by period and ttr value :)

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
  %rest:path("ttr/{$time}/{$lt}/{$gt}")
  %rest:GET
  function page:ttrfilt(
    $time,$lt as xs:double,$gt as xs:double)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: TTR</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/basexc.css"/>
</head>

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa &amp; LatTy: TTR</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">
<h2>TTR</h2>
<p> TTR maiores a {$lt} et minores quam {$gt} in periodo {$time}.</p>
<blockquote class="croala">
	<div class="table-responsive">
    { croala:ttrfilter($time,$lt,$gt) }
    </div>
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footer() }
</div>
</body>
</html>
};

return

