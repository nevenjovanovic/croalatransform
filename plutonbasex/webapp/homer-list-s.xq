import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../repo/croala.xqm";

(: list sentences with seg/@corresp :)

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
  %rest:path("/homer/sent")
  %rest:GET
  function page:homersent1()
{
  (: HTML template starts here :)

<html>
<head><title>Homer: grčki i hrvatski</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/homerc.css"/>
</head>

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Homer grčki  i hrvatski <small>- popis rečenica</small></h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/studij/grcki-preddiplomski/">Preddiplomski studij grčkog jezika i književnosti</a>, { current-date() }.</p>
</div>
<div class="container-fluid">

<p><pre>Functio nominatur: {rest:uri()}.</pre></p>
<blockquote class="croala">
    { 
    element div {
      attribute class { "row"} ,
      element div {
        attribute class { "col-md-6"} ,
        element h2 { "Grčki"},
      croala:homerlist1('tlg0012.tlg001.perseus-grc1.xml')
},

 element div {
        attribute class { "col-md-6"} ,
        element h2 { "Hrvatski"},
      croala:homerlist1('tlg0012.tlg001.perseus-hrv1.xml')
}

}
     }
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footerhomer() }
</div>
</body>
</html>
};

return
