import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: bun-cob-vic-group-indiv, show totals for names in individual files, with 0 for absent names; sortable table :)

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
  %rest:path("/bcv/individu/{$f}")
  %rest:GET
  function page:buncobvicindividu($f)
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa epica: <small>Bunić, Čobarnić, Vičić singuli</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: <tt>{rest:uri()}</tt>.</p>
<p>Formae praesentes et absentes in {$f}.</p>
<p><b>TIP</b> Sort multiple columns simultaneously by holding down the SHIFT key and clicking headers of columns on which you want to sort!</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered numb">
  <thead>
  <tr>
  <td>Lemma</td>
  <td>Formae</td>
  <td>Doc</td>
  <td>Quot</td>
  <td>Classis</td>
  <td>Typus</td>
  </tr>
  </thead>
  <tbody>
    { 
    for $t in db:open('bun-cob-vic-indiv')//tr[Doc=$f]
      let $td := $t/Lemma
      group by $td
  return element tr { 
    element td { 
    element code { $td } } , 
    element td { element a {
      croala:philo02(string-join(distinct-values($t/Forma),'+'), "bun-cob-vic"),
      distinct-values($t/Forma)
    } },
    element td { substring($f, 1, 1) }, 
    element td { sum(data($t/Count))},
    element td { distinct-values($t/Classis)  },
    element td { distinct-values($t/Typus)  }
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

