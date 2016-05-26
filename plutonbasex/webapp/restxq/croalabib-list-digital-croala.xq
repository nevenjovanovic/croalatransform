(:~
 : List all digital editions in CroALa with
 : entries in CroALaBib
 : @author Neven Jovanović
 :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';
declare variable $title := 'Croatiae auctores Latini DB - editionum digitalium indiculus';

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/croalabib-digital-croala"
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
  function page:croaladigicroindiculus()
{
  <html>
     { croala:htmlhead($title) }
    <body>
    <div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>

<div class="container-fluid">
      <div class="col-md-6">
<p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>

<p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
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
<div class="col-md-6">
{croala:infodb('croalabib')}
</div>
      </div>
</div>

<div class="container-fluid">
<blockquote class="croala">
<div class="container-fluid">
      <h1>Index titulorum in LatTy</h1>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Nota bibliographica editionis in CroALa</td>
  </tr>
  </thead>
  <tbody>
    { 
    croala:croalabiblist()
  }
  </tbody>
  </table>
</div>
</div>
</blockquote>
</div>
<hr/>
{
     croala:footer() 
  }

    </body>
  </html>
};

return
