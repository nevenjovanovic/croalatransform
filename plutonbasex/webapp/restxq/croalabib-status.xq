import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
(: croalabib-status, display just the header with basic info :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "xhtml";

declare variable $title := "CroALaBib status";

declare
  %rest:path("/croalabibstatus")
  %rest:GET
  function page:croalabibstatus()
{
  (: HTML template starts here :)
element html { croala:htmlheadserver($title) ,

<body>
<div class="container-fluid">
  <div class="jumbotron">
    <h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span><span> </span> { $title } </h1>
    <div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
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
      <div class="col-md-6 dbinfo">
        {croala:infodb('croalabib')}
      </div>
     </div>
  </div>
</div>
</body>
 }
};

return
