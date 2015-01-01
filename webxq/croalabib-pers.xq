import module namespace rest = "http://exquery.org/ns/restxq";
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
declare %rest:GET %rest:POST %rest:path("croalabib-pers")
%rest:query-param("nomq", "{$nomq}")
function page:croalabib-pers($nomq as xs:string) { 

(: Present an author / person page :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: personae</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: personae</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>


{ 
(: The actual XQuery starts here :)
let $doc := collection("croalabib")//tei:person[@xml:id=$nomq]
return element blockquote { element title { data($doc/@xml:id) } ,
$doc/tei:persName,

if(exists($doc/tei:birth[tei:date])) then 
element birth { "N: " , data($doc/tei:birth)
}
else(),

if(exists($doc/tei:death[tei:date])) then element death { "M: ",
data($doc/tei:death) }
else(),


if(exists($doc/tei:floruit[tei:date])) then element floruit { 
"Floruit: ",
data($doc/tei:floruit)
}
else(),

$doc/tei:occupation,



element br {},

if(exists($doc/tei:event[@when|@notBefore|@notAfter])) then element title {
"Eventus: ",
string-join($doc/tei:event/(@when|@notBefore|@notAfter), '; ')
}
else(),

$doc/tei:event

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
