(:~
 : List all data on a croalabib person with @xml:id
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: list persons with page urls :)
declare function croala:persona($xmlid) {
  for $i in collection("croalabib")//*:listPerson/*:person[@xml:id=$xmlid]
  return element p{
    $i/*[not(.=*:ref)] ,
    element a { attribute href { data($i/*:bibl[@type="authorID"]/*:ref/@target) } , data($i/*:bibl[@type="authorID"]/*:ref) }
  }
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/persona/{$xmlid}")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:personalis($xmlid)
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini DB - persona {$xmlid}</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/basexc.css"/>
    </head>
    <body>
    <div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container-fluid">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctorum Latinorum bibliographia: <small>persona {$xmlid}</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Persona {$xmlid}</h1>
 {
   croala:persona($xmlid)
 }
 
</div>
</blockquote>
     </div>
<hr/>
{ croala:footer() }
</div>
    </body>
  </html>
};

return
