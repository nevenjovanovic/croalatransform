import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";

(: croalabib-drame-facet2: on server, list values in a facet :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/croalabib2/facet/{$naziv}")
  %rest:GET
  function page:croalabibfacet1($naziv)
{
  (: HTML template starts here :)
let $title := "CroALabib: drama - " || $naziv
return
element html { croala:htmlheadserver($title) ,

<body>
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALabib: drama - {$naziv}</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">

<blockquote class="croala">
    { 
    element div {
      attribute class { "row"} ,
      element h1 { $naziv } ,
      croala:facet($naziv)

}
     }
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footerserver() }
</div>
</body>
}
};

return

