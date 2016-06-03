import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace nlwl = "http://croala.ffzg.unizg.hr/nlwl" at "../../repo/nlwl.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Lemmata Neolatina - orthographicae variationes';
declare variable $content := "A list of words from the Neulateinische Wortliste with largest number of orthographical variants.";
declare variable $keywords := "Latin lexicography, Neo-Latin language, lexicon analysis";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nlwl-orthogr")
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
  function page:nlwlorthographice()
{
  (: HTML template starts here :)

<html>
{ nlwl:htmlheadserver($title, $content, $keywords) }
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
<p>Lemmata Neolatina: <a href="http://croala.ffzg.unizg.hr">CroALa</a> et <a href="http://www.neulatein.de/neulateinische_wortliste.htm">Neulateinische Wortliste</a>, { current-date() }.</p>
<p>Quae verba Neolatina orthographice varientur, et quot sint eis variationes?</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('nlwl')}
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
  <td>Quot variationes</td>
	<td>Quae lemmata</td>
  </tr>
	</thead>
	<tbody>
    { 
    nlwl:ortho()
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




