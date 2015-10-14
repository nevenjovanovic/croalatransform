(:~
 : Return list of plays chronologically
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: return chronological list of plays as divs :)
declare function croala:dramachrono() {
  for $d in collection("croalabib")//*:listBibl[@type='croala.drama']/*:bibl/*:date
order by $d/@period , $d/@when
let $zapis := $d/..
let $naslov := $d/../*:title[1]
return if ($naslov/text()) then element div {
  $zapis/*:author ,
  element title { data($naslov) } ,
  $d,
  $zapis/*:placeName
}
else 
element div { 
$zapis/*:author ,
element title { "TITULUS IGNORATUR"},
$d,
  $zapis/*:placeName
}
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/dramachrono"
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
  function page:dramachrono()
  as element(
  Q{
    http://www.w3.org/1999/xhtml
  }html
)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini - dramata chronologice</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctorum Latinorum bibliographia: <small>dramata chronologice</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, {
     current-date() 
  }.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-8 col-md-offset-1">
      <h1>Dramata chronologice</h1>
 {
   croala:dramachrono()
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
