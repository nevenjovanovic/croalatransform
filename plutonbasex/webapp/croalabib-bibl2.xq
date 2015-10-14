(:~
 : This module contains some basic examples for RESTXQ annotations and some croalabib queries
 : @author BaseX Team, Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/secundbibl")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  %rest:POST
  %rest:form-param("sbbq","{$sbbq}", "(no sbbq)")
  function page:secundbibl(
    $sbbq as xs:string)
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini DB</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctorum Latinorum bibliographia: <small>BaseX + TEI XML</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
</div>
<div class="row">
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Bibliographica</h1>
      
      {
        (:~
 : Search for names.
 :)
		element div { 
		let $sbbqq := $sbbq || '.*'
			for $i in collection('croalabib')//*:listBibl[@ana='croala.sekundarna']/*:biblStruct[descendant::*[name()='title' or name()='author'][text() contains text {$sbbqq} using wildcards]]
	        return element p { 
          attribute class { "lead"},
          $i } }
}
      </div>
      
      
</div>
<hr/>
{ croala:footer() }
</div>
    </body>
  </html>
};





return
