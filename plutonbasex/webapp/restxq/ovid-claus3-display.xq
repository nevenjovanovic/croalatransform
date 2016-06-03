(: display Ovid's three word clausulae :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../repo/vitezovic.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Clausulae apud Ovidium';
declare variable $content := "Three word clausulae in Ovid's poetic epistles, ordered by fequency.";
declare variable $keywords := "Neo-Latin literature, poetic language, comparative analysis of literature, poetic verse, Ovid, clausulae, frequency";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("ovid-claus3")
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
  function page:ovidclaus3()
{
  (: HTML template starts here :)

<html>
{ vit:htmlheadserver($title, $content, $keywords) }
<body text="#000000">

<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
<div class="container-fluid">
<div class="col-md-6">
<p>Ritter Vitezović et Ovidius: <a href="http://croala.ffzg.unizg.hr">CroALa</a> et <a href="http://www.perseus.tufts.edu/">Persei bibliotheca digitalis</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a>, <a href="http://www.unipu.hr/index.php?id=273">Violeta Moretti</a>, <a href="https://unipu.academia.edu/GoranaStepanic">Gorana Stepanić</a></p>
<p>Quae clausulae occurrunt in epistulis Ovidianis, quae clausulae repetuntur?</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('ovid-pdl2')}
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
  <td>Clausula</td>
	<td>Ubi</td>
  </tr>
	</thead>
	{vit:group3("ovidfv2","ovid-pdl2")}
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




