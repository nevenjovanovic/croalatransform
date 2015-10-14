import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: croala-latty-periods1 - group authors in two dbs by periods :)
(: display as two tables side by side, hopefully :)


declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare function croala:authstats2($collection) {
for $i in collection($collection)//*:listPerson[ends-with(@type, 'auctores')]/*:person
let $period := $i/*:floruit[1]/@period
group by $period
order by $period
return element tr {
  element td { if ($period) then $period else "NN" },
  element td { count( $i )}
}
};

declare function croala:authco2($collection) {
let $co := count(collection($collection)//*:listPerson[ends-with(@type, 'auctores')]/*:person)
return $co };


(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 :)
declare
  %rest:path("/auctores/periodi2")
  %rest:GET
  function page:croalalattyauctperiod2()
{
  (: HTML template starts here :)

<html>
<head><title>Croatiae et Tyrolidis auctores Latini</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Croatiae et Tyrolidis auctores Latini:<small> per tertiam partem saeculi</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: <tt>{rest:uri()}</tt>.</p>
</div>
<div class="container-fluid">
{
for $bibs in ("tei-tyrolis", "croalabib")
let $c := croala:authstats2($bibs)
return 
element div { attribute class {"col-md-6"},
element h2 { $bibs || " (" || croala:authco2($bibs) || ")" },
element table { 
attribute class { "table table-striped"},
element thead {
  element tr {
    element td { "Saeculi pars" },
    element td { "Quot"}
  }
},
element tbody { 
$c }
}
}
}
     <p/>
     </div>
<hr/>
{ croala:footer() }
</div>
</body>
</html>
};

return

