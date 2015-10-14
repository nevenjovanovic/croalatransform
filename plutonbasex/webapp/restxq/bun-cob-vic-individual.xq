import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: bun-cob-vic-individual, search from list of forms in individual file :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


(:~
 : URL address 
 :)
declare
  %rest:path("/bcv1/{$filename}/{$gt}/{$lt}")
  %rest:GET
  function page:bcv1indiv01(
    $filename, $gt, $lt)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa epica: Bunić, Čobarnić, Vičić</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa epica: <small>Bunić, Čobarnić, Vičić</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
<p>Nomina occurrentia in {$filename}, a forma {$gt} usque ad {$lt}. Omnes formae sunt numero { count(collection("bun-cob-vic-2")//record)}.</p>
<p>Functionis indiculus: <tt>{rest:uri()}</tt>. Tabula ordinari potest per columnas.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Lemma</td>
  <td>Classis</td>
  <td>Typus</td>
  <td>Forma</td>
  <td>Versus</td>
  </tr></thead>
  <tbody>
    { 
    (: search for all forms in an individual file :)
(: return NIHIL if form is absent :)
for $s in collection("bun-cob-vic-2")//record[position() ge xs:integer($gt) and position() le xs:integer($lt) ]
let $stih := db:open("bun-cob-vic", $filename)//*:text//*:l[descendant::text() contains text { data($s/Forma) }]
return 
element tr {
  element td { data($s/Lemma)} ,
  element td { data($s/Classis)},
  element td { data($s/Typus)},
  element td { data($s/Forma)} ,
if ($stih) then 
element td { 
for $l in $stih return 
  element code { 
   data($l/@n) , data($l) } }
else 
  element td { "NIHIL" }

}
    }
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

