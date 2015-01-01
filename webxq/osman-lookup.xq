import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace db = 'http://basex.org/modules/db';
declare namespace proc = 'http://basex.org/modules/proc';
declare namespace aligned-text = "http://alpheios.net/namespaces/aligned-text";
declare default element namespace "http://alpheios.net/namespaces/aligned-text";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare %rest:GET %rest:POST %rest:path("osman-lookup")

function page:osman-lookup() { 

(: HTML template starts here :)


    
    

<html>
<head><title>Textus parallelli</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
      <div class="right"><img src="static/morlaque.jpg"  align="right"/></div>

<h2>Textus parallelli</h2>
<div><p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }. Functio nominatur: {rest:uri()}</p></div>

      <form method="post" action="osman-w">
        <p>Verbum sive verba quaere (e. g. 'uokoli sreće pristaje'):<br />
        <input name="osmw" size="50" value="kolo od sreće"></input>
        <input type="submit" /></p>
      </form>
      <h3>Verba</h3>
        { for $n in 
let $a := 
for $i in collection("osman")//*:wds[@lnum="L1"]//*:text
order by $i
return distinct-values($i)
return distinct-values($a)
return element td {$n}
}
      
 
 
 </body>
  </html>
};

return