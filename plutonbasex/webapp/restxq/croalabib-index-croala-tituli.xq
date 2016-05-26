(:~
 : Get a list of titles in CroALa with links to records
 : @author Neven Jovanović
 :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';
(: make title for page and text :)
declare variable $title := "CroALa bibliographia - tituli in db" ;

(: list persons with page urls :)
declare function croala:titlist() {
  element tbody {
  for $i in collection('croalabib')//*:listBibl[@type='croala.libri.digital']/*:bibl[*:relatedItem[*:ref[@type='croala']]]
  let $purl := 'http://croala.ffzg.unizg.hr/basex/croalatitulus/' || data($i/@xml:id)
  order by $i/@xml:id collation "?lang=hr"
  return element tr{
    element td {
    element a { attribute href { $purl  } , data($i/@xml:id)
  }
}
  }
}
};

(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/croalatituli")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:croalatituli()
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span><span> </span> { $title }</h1>



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
<div class="container-fluid col-xs-6 col-md-offset-1">
<p>CroALaBib habet ex CroALa titulos  
{ 
    count(croala:titlist()//*:tr)
  }.</p>
</div>
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Index titulorum in CroALa</h1>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Titulus</td>
  </tr></thead>
    { 
    croala:titlist()
  }
  </table>
</div>
</div>
</blockquote>
     </div>
<hr/>
{ croala:footerserver() }
</div>
    </body>
  </html>
};

return
