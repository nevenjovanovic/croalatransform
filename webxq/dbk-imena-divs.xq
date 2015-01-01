import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare %rest:GET %rest:POST %rest:path("dbk-imena")
function page:dbk-imena() { 

(: Create index of names by sessions and months :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)

let $doc := collection("dbkref")//tei:body
return

(: HTML template starts here :)

<html>
<head><title>Index personarum in reformationibus Ragusinis</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>Index personarum in sessionibus consiliorum Ragusinorum.</h1>

<p><a href="http://bitbucket.org/nevenjovanovic/dbk-ref/overview">MHR in XML</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table width="100%" rules="rows">
    
    <thead>
      <tr>
          <td>ID</td> 
          <td>Nomen</td>
          <td>Sessionis ID</td>
          <td>Mensis ID</td>
      </tr>
    </thead>
    <tbody>{ 
(: The actual XQuery starts here :)    
    for $p in $doc//tei:persName[@ref]
 
    let $pid := $p/@ref
let $divid := $p/ancestor::tei:div[@ana[. eq 'dies']]/@n
let $divmon := $p/ancestor::tei:div[@ana[. eq 'mensis']]/@n
order by $pid
return
(: HTML formatting of the result :)
<tr>
<td type="nomenid">{data($pid)}</td>
<td type="nomen">{data($p//text())}</td>
<td type="diesid">{data($divid)}</td>
<td type="mensid">{data($divmon)}</td>
</tr>
}</tbody>
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p><span class="fin">Anno MMXI </span><img src="http://gap.alexandriaarchive.org/gapvis/images/google_logo.png" alt="Google"/><span class="fin"> pecuniam dedit.</span></p>
</div>
</body>
</html>
};
return
