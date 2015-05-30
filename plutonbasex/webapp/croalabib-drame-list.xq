import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

(: croalabib-drame-list: list facets for exploring :)

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
  %rest:path("/croalabib2/drama")
  %rest:GET
  function page:croalabibdrama()
{
  (: HTML template starts here :)

<html>
<head><title>CroALabib: drama</title>
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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALabib: drama</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="container-fluid">

<blockquote class="croala">
    { 
    element div {
      attribute class { "row"} ,
      element h1 { "Izvedbe"} ,
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]', 'zapisi') ,
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="lat" and text()]', 'naslovi_latinski'),
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="hrv" and text()]', 'naslovi_hrvatski'),
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]/*:bibl/*:ref', 'RHK'),
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]/*:bibl/*:relatedItem/*:listBibl/*:bibl', 'bibliografija'),
croala:facet2('//*:body/*:listBibl[@type="croala.drama.sekundarna"]/*:bibl', 'bibliografija_naslovi')
} ,
element div {
        attribute class { "row"} ,
      element h1 { "Mjesta"} ,
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:placeName', 'naselja') 
,
croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:address', 'lokacije')
} ,
element div {
   attribute class { "row"} ,
      element h1 { "Vrijeme"} ,
      croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:date', 'datumi'),
      croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:date/@period', 'razdoblja')
},
element div {
   attribute class { "row"} ,
      element h1 { "Ljudi i organizacije"} ,
      croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:author', 'autori'),
      croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:orgName', 'organizacije'),
      croala:facet2('//*:body/*:listBibl[@type="croala.drama"]//*:persName', 'osobe')
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

