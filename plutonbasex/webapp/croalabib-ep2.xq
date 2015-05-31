import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace db = 'http://basex.org/modules/db';
declare namespace proc = 'http://basex.org/modules/proc';
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare %rest:GET %rest:POST %rest:path("croalabib-ep2")
%rest:query-param("epq", "{$epq}")
function page:croalabib-ep2($epq as xs:string) { 

(: Search for an annotation, or part of annotation :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: annotationes</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: annotationes</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>
<p>Functio nominatur: {rest:uri()}</p>

{ 
(: The actual XQuery starts here :)
element p {"Inveniuntur: ", count((collection("croalabib")//tei:biblStruct|collection("croalabib")//tei:bibl)[tei:note[contains(@target,$epq)]])},

element table { 
element thead {
    element tr {
      element th {"Opus"},
      element th {"CatNum"},
      element th {"CatCod"},
      element th {"Cat"},
      element th {"Temp"}, 
      element th {"Met"}
    }
  } ,
 for $i in (collection("croalabib")//tei:biblStruct
|
collection("croalabib")//tei:bibl)[tei:note[contains(@target,$epq)]]
let $id := $i/@xml:id
let $solr := "http://solr.ffzg.hr/basex/rest/croalabib?query=//*[@xml:id='REPLACE_S']&amp;wrap=yes"
order by count($i//tei:note[contains(@target,$epq)]/@target) descending, $id
return element tr { element td { element a { if ($id) then attribute href {replace($solr,'REPLACE_S',data($id))}
else() ,  data($id) } } , 
element td { count($i//tei:note[contains(@target,$epq)]/@target)} ,
element td { data($i//tei:note[contains(@target,$epq)]/@target) } , 
element td { data($i//tei:note[contains(@target,$epq)]) },
element td { for $a in $i//(tei:date|tei:monogr/tei:imprint/tei:date)/@period return replace($a, 'http://semium.org/time/', '') },
element td { for $a in $i//tei:note[@type='metrum'] return data($a) }
} }}

     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return