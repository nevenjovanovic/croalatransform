(:~
 : List all data on a title in CroALa using @xml:id
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: list persons with page urls :)
declare function croala:tituluscroala(
  $xmlid
) {
  for $i in collection(
    "croalabib"
  )//*:listBibl[@type='croala.libri.digital']/*:bibl[@xml:id=$xmlid]
  return 
  element div {
  element p{
    $i/*[not(name()="bibl" and @type="authorID")] } ,
    (: authority control:)
    if ($i/*:bibl[@type="authorID"]) then 
    element div { attribute class { "table-responsive"} ,
    element h2 { "ID"} ,
    element table { attribute class { "table-striped  table-hover" },
    element tbody {
    for $authid in $i/*:bibl[@type="authorID"]
    return
    
      element tr {
        element td { 
        element code { "Auctoritas" } },
        element td {
    element ref {
    element a {
         attribute href {
           croala:authidhref(
            data(
              $authid/*:ref/@type
            ), data(
              $authid/*:ref/@target
            )
          )  
        } , data(
          $authid/*:ref
        ) 
      }
    }
  }
  }
  }
}
}
  else()
    (: list of works :)
    
    

}
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/croalatitulus/{
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
  function page:tituluscroala(
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
      <title>Croatiae auctores Latini DB - persona {
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctorum Latinorum bibliographia: <small>titulus {
    $xmlid
  }</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, {
     current-date() 
  }.</p>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-8 col-md-offset-1">
      <h1>Titulus {
    $xmlid
  }</h1>
 {
   croala:tituluscroala(
      $xmlid
    )
 }
 
</div>
</blockquote>
     </div>
<hr/>
{
     croala:footerserver() 
  }
</div>
    </body>
  </html>
};

return
