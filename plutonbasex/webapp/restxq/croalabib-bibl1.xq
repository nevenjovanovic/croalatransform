(:~
 : This module contains some basic examples for RESTXQ annotations and some croalabib queries
 : @author BaseX Team, Neven Jovanović
 :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := "CroALa bibliographia - opera docta" ;

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/biblio")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:bibliostart()
{
  <html>
    { croala:htmlheadserver($title) }
    <body>
    <div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>

<div class="container-fluid">
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
</div>
<div class="container-fluid">
 <blockquote class="croala">
     <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Recentiora quaere</h1>
      <p>Litteras aliquot de titulo sive de auctoris nomine scribe.</p>
      <form method="post" action="/basex/secundbibl">
        <p>E. g. <b>Dubrovn</b>:<br />
        <input name="sbbq" size="50"></input>
        <input type="submit" class="btn btn-primary" value="Quaere" /></p>
      </form>
      </div>
  </blockquote>
</div>
<hr/>
{ croala:footerserver() }

    </body>
  </html>
};

return
