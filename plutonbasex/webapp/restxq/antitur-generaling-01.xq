(: antitur-generaling-01, display genres over languages :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace antitur = "http://croala.ffzg.unizg.hr/antiturcica" at "../../repo/antitur.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Antiturcica iterata DB, genera in linguis';



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("antitur-generaling")
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
  function page:antiturgeneraling()
{
  (: HTML template starts here :)

<html>
{ croala:htmlheadserver($title) }
<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>

<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
<div class="container-fluid">
<div class="col-md-6">
<p><a href="http://croala.ffzg.unizg.hr">Croantiturcica</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('croantiturcica')}
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
  <td>ID</td>
	<td>Genus</td>
	<td>De dato</td>
	<td>Lingua</td>
  </tr>
	</thead>
	<tbody>
    { 
    antitur:generaling()
     }
     </tbody>
     </table>
     </div>
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footerserver() }

</body>
</html>
};

return




