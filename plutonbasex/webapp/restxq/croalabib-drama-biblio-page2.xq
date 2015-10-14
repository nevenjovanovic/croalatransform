import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at "../../repo/drama.xqm";
(: croalabib-drama-biblio-page, practising TDD w/BaseX :)
(: show data on specific drama :)
(: pass its xml:id after # :)
(: format data nicely :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "xhtml";

declare variable $title := "CroALaBib dramata: opera docta";

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/dramabib")
  %rest:GET
  function page:dramabibpage()
{
  (: HTML template starts here :)
element html { croala:htmlhead-tablesorter-server($title) ,

<body>
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
</div>
<div class="container-fluid">
  <div class="jumbotron">
    <h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span><span> </span> { $title } </h1>
    <div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr/intro">CroALa</a>, { current-date() }.</p>
      <p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
      </div>
      <div class="col-md-6 dbinfo">
        {croala:infodb('croalabib')}
      </div>
     </div>
  </div>
<!-- insert function call here -->
{ drama:getbibliolist('croalabib') }

<hr/>
{ croala:footerserver() }
</div>
{ croala:tablescript () }
</body>
 }
};

return

