(: CroALa Pelagios :)
(: use a CTS URN to open a node :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace cp = "http://croala.ffzg.unizg.hr/croalapelagios" at "../../repo/croalapelagios.xqm";
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../repo/vitezovic.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Contextus loci in CroALa';
declare variable $content := "Display a passage containing a CTS URN of a place name.";
declare variable $keywords := "Neo-Latin literature, CTS / CITE architecture, Pelagios historical places, gazetteer, literary analysis, scholarly edition, analytical exemplar";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("cts/{$urn}")
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
  function page:croalapelagiosurn($urn)
{
  (: HTML template starts here :)

<html>
{ vit:htmlheadserver($title, $content, $keywords) }
<body text="#000000">

<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
<div class="container-fluid">
<div class="col-md-6">
<p>Locus in <a href="http://croala.ffzg.unizg.hr">CroALa</a> aspectu <a href="http://commons.pelagios.org/">Pelagii</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
<p>Verbum quod locum denotat.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('cp')}
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
  <td>URN</td>
  <td>Verbum</td>
	<td>Textus</td>
  </tr>
	</thead>
  <tbody>
	{cp:openurn($urn)}
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



