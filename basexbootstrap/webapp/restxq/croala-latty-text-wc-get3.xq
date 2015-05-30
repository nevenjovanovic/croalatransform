import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: show word count in respective text db, with links to texts in basex db :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

declare function croala:wc ($collection, $where) { 
let $idx := 
for $dc in collection($collection)//*[name()=$where and not(descendant::*[name()=$where])]
let $name := db:node-pre($dc)
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td { 
element a { 
  croala:solraddr($collection, $name) ,
  db:path($dc)
}
},
element td { attribute class {"clausula"} , $wc }
}

return element tbody { 
element tr { 
element td { $where || ": " || count($idx)} , 
element td {  attribute class {"clausula"} , sum( for $a in $idx/td[2] return xs:integer($a))}
},
$idx 
}

};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/numerus/{$auct}/{$where}")
  %rest:GET
  function page:quotverba(
    $auct, $where)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: quot verba</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa &amp; LatTy: <small>quot verba in {$where}?</small></h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Numeramus verba in collectione {$auct}, in {$where}.</p>
<p>Functio nominatur: <tt>{rest:uri()}</tt>.</p>
<p>Quaerere potes in elementis: <tt>text, div, p, l, note</tt>...</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Textus</td>
  <td>Verborum numerus</td>
  </tr></thead>
    { croala:wc($auct, $where) }
  </table>
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

