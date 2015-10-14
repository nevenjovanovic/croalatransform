import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: bun-cob-vic-individual-list, a list of files to search from list of forms in :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


(:~
: url address of function
 :)
declare
  %rest:path("/bcv1/singuli")
  %rest:GET
  function page:bcv1singuli()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa epica: Bunić, Čobarnić, Vičić - singuli</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa epica: <small>Bunić, Čobarnić, Vičić - formae in singulis</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>

<p>Functionis indiculus: <tt>{rest:uri()}</tt>. Ostende formas in singulis operibus.</p>
</div>
<div class="container-fluid">
<h1>Operum indiculus</h1>
<p>Quaere primas centum formas in quovis opere. Ut plus minusve quaeratur, numeros alios in indiculo URL scribe.</p>
<blockquote class="croala">
<ul>
{
  for $f in collection("bun-cob-vic")//*:TEI
  let $adresa := db:path($f)
  order by $adresa
  return element li { 
  element a {
    attribute href { $adresa || "/1/100" },
    $adresa
  } }
}
  </ul>
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

