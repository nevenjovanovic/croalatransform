import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../repo/vitezovic.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Ritter Vitezović et Ovidius';
declare variable $content := "Counts of verse lines in poetic letters by a Croatian Neo-Latin author Paulus Ritter Vitezović, compared to counts in Ovid's epistles.";
declare variable $keywords := "Neo-Latin literature, poetic language, comparative analysis of literature, poetic verse, Ovid, Croatia";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("vitezovic-versus")
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
  function page:vitezovicversus()
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
<p>Quot versus in epistulis Ritteri Vitezović, quot in epistulis Ovidianis?</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('vitezovic-epistolae2')}<br/>
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
  <td>Titulus</td>
	<td>Quot versus</td>
  </tr>
	</thead>
	
  
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




