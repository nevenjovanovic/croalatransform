(:~
 : Get a list of titles in LatTy with links to records
 : @author Neven Jovanović
 :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace latty = "http://www.ffzg.unizg.hr/klafil/latty" at "../../repo/latty.xqm";

declare namespace page = 'http://basex.org/examples/web-page';
(: make title for page and text :)
declare variable $title := "LatTy index titulorum" ;

(: list persons with page urls :)


(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path("/lattytituli")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:lattytituli()
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
<p><a href="http://solr.ffzg.hr/philo4/latty2/">LatTy</a>, { current-date() }.</p>

<p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>

</div>
<div class="col-md-6">
{croala:infodb('latty0')}
</div>
      </div>
</div>
<div class="container-fluid">
<blockquote class="croala">
<div class="container-fluid col-xs-6 col-md-offset-1">
<p>Opera in LatTy:   
{ 
    count(latty:indextitulorum()//*:tr)
  }.</p>
</div>
      <div class="container-fluid col-xs-6 col-md-8 col-md-offset-1">
      <h1>Index titulorum in LatTy</h1>
 <div class="table-responsive">
<table id="myTable" class="tablesorter table-striped  table-hover table-centered">
  <thead>
  <tr>
  <td>Titulus</td>
  </tr></thead>
    { 
    latty:indextitulorum()
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
