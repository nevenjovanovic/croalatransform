(:~
 : Get a list of croalabib persons with links to records
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

(: list persons with page urls :)
declare function croala:perslist() {
  for $i in collection("croalabib")//*:listPerson/*:person
  let $purl := 'http://croala.ffzg.unizg.hr/basex/persona/' || data($i/@xml:id)
  let $lpurl := replace($purl,'http://croala.ffzg.unizg.hr/basex/', '')
  order by $i/*:persName[1]
  return element tr{
    element td { data($i/*:persName[1]) } ,
    element td {
    element a { attribute href { $lpurl  } , replace($purl, 'http://', '')
  }
}
  }
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/indexpersonarum")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:start()
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Croatiae auctores Latini DB - index personarum</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>Croatiae auctorum Latinorum bibliographia: <small>index personarum</small></h1>

<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>

      <div class="container-fluid">
      <blockquote class="croala">
			<ul>
			<li>Tituli: { croala:bibcount() }</li>
			<li>Personae: { croala:perscount() }</li>
			<li>Opera: { croala:opcount() }</li>
			<li>Manuscripta: { croala:mscount() }</li>
			<li>Exemplaria: { croala:itemcount() }</li>
			<li>Digitalia: { croala:digicount() }</li>
			</ul>
      </blockquote>
      </div>
</div>
<div class="container-fluid">
<blockquote class="croala">
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Index personarum</h1>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Nomen</td>
  <td>CroALaBib URL</td>
  </tr></thead>
  <tbody>
    { 
    croala:perslist()
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
    </body>
  </html>
};

return
