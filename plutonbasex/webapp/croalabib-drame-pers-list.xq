import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

(: croalabib-drame-pers-list: list facets of real persons connected with drama for exploring :)

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
  %rest:path("/croalabib2/drama-personae")
  %rest:GET
  function page:croalabibdramapers()
{
  (: HTML template starts here :)

<html>
<head><title>CroALabib: personae in dramatibus</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
</head>

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALabib: personae in dramatibus</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">

<blockquote class="croala">
    { 
    element div {
      attribute class { "row"} ,
      element h1 { "Condiciones"} ,
croala:facet3('/*:TEI/*:text//*:listPerson[@type="croala.personae.drama"]/*:person/*:trait/*:desc', 'condiciones') 
}
     }
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footer() }
</div>
</body>
</html>
};

return

