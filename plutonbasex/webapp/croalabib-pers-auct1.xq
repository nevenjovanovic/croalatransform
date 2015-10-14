(:~
 : Get a list of croalabib authors with links to records
 : @author Neven Jovanović
 :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

declare namespace page = 'http://basex.org/examples/web-page';
(: make title for page and text :)
declare variable $title := "CroALa bibliographia - index auctorum" ;

(: list persons with page urls :)
declare function croala:auctlist($collection) {
  element tbody {
  for $i in collection($collection)//*:listPerson[ends-with(@type,".auctores")]/*:person
  let $purl := 'http://croala.ffzg.unizg.hr/basex/persona/' || data($i/@xml:id)
  order by $i/*:persName[1] collation "?lang=hr"
  return element tr{
    element td { data($i/*:persName[1]) } ,
    element td {
    element a { attribute href { $purl  } , replace($purl, 'http://', '')
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
  %rest:path("/indexauctorum/{$collection}")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:auctores($collection)
  as element(Q{http://www.w3.org/1999/xhtml}html)
{
  <html>
    { croala:htmlheadbasex($title) }
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
<p>In {$collection} sunt auctores 
{ 
    count(croala:auctlist($collection)//*:tr)
  }.</p>
</div>
      <div class="container-fluid col-xs-6 col-md-offset-1">
      <h1>Index auctorum</h1>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Nomen</td>
  <td>CroALaBib URL</td>
  </tr></thead>
    { 
    croala:auctlist($collection)
  }
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
