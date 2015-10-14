(:~
 : Get a list of croala fictional named entities with links to records
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: list persons with page urls :)
declare function croala:namentlist() {
  for $i in collection("croala-nomina")//*:entry
  let $purl := 'http://croala.ffzg.unizg.hr/basex/croalanp/' || db:node-id($i)
  let $lpurl := replace($purl,'http://croala.ffzg.unizg.hr/basex/', '')
  order by $i/*:form[1] collation "?lang=hr"
  return element tr{
    element td { data($i/*:form[1]) } ,
    element td {
    element a { attribute href { $purl  } , replace($purl, 'http://', '')
  },
  element td { data($i/*:sense/*:usg[2])},
    element td { data($i/*:sense/*:usg[3])}
}
  }
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/nominapropria")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:start()
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini - index nominum propriorum</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctores Latini: <small>index nominum propriorum</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Index nominum propriorum</h1>
      <p>n = { count(croala:namentlist() )}</p>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Nomen proprium</td>
  <td>CroALa ID URL</td>
  <td>Classis</td>
  <td>Typus</td>
  </tr></thead>
  <tbody>
    { 
    croala:namentlist()
  }
 
      </tbody>
  </table>
</div>
</div>
</blockquote>
     </div>
<hr/>
{ croala:footer() }
</div>
{ croala:tablescript () }
    </body>
  </html>
};

return
