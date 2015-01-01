import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace db = 'http://basex.org/modules/db';
declare namespace proc = 'http://basex.org/modules/proc';
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare %rest:GET %rest:POST %rest:path("osman-w")
%rest:query-param("osmw", "{$osmw}")
function page:osman-w($osmw as xs:token) { 

(: Search for an annotation, or part of annotation :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>Textus parallelli - inventa</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>Textus parallelli: inventa</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>
<p>Functio nominatur: {rest:uri()}</p>

{ 
(: The actual XQuery starts here :)
element p {"Inveniuntur: ", count(collection("osman")//*:sentence//*:w[*:text contains text {tokenize($osmw, ' ')} using wildcards])},

element table { 
element thead {
    element tr {
      element th {"L1"},
      element th {"L2"}
    }
  } ,
for $i in collection("osman")//*:sentence
for $a in $i//*:w[*:text contains text {tokenize($osmw, ' ')} using wildcards]
let $r := tokenize($a/*:refs/@nrefs, ' ')
let $h := $i/*:wds[@lnum='L2']/*:w[@n=$r]
return

element tr { attribute nrefs {$r} , 
element td { attribute id {db:node-id($a)} , data($a) }, 
element td { attribute id {db:node-id($h)} , data($h) } }
}
}

     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};

return
