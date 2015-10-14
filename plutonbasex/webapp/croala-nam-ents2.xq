(:~
 : List all data on a croalabib person with @xml:id
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: list persons with page urls :)
declare function croala:np2(
  $xmlid
) {
  for $i in db:open-id(
    "croala-nomina", $xmlid
  )
  return 
  element div {
  element p{
    $i
  }
}

};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/croalanp/{
    $xmlid
  }"
)
  %output:method(
  "xhtml"
)
  %output:omit-xml-declaration(
  "no"
)
  %output:doctype-public(
  "-//W3C//DTD XHTML 1.0 Transitional//EN"
)
  %output:doctype-system(
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
)
  function page:nomenp2(
  $xmlid
)
  as element(
  Q{
    http://www.w3.org/1999/xhtml
  }html
)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini - nomen proprium {
    $xmlid
  }</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctores Latini: <small>nomen proprium {
    $xmlid
  }</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, {
     current-date() 
  }.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-8 col-md-offset-1">
      <h1>Nomen proprium {
    $xmlid
  }</h1>
 {
   croala:np2(
      $xmlid
    )
 }
 
</div>
</blockquote>
     </div>
<hr/>
{
     croala:footer() 
  }
</div>
    </body>
  </html>
};

return
