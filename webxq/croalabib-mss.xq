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
declare %rest:GET %rest:POST %rest:path("croalabib-mss")
function page:croalabib-mss() { 

(: Present an work title and ID / author name and ID page :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: MSS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: manuscripta</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>
<p>Functio nominatur: {rest:uri()}</p>

{ 
(: The actual XQuery starts here :)
let $col := collection("croalabib")
let $doc1 := $col//tei:msDesc
return element div {
element p {  "In collectione ",  db:name($col//*[@xml:id="latinisti-djela-juric"]) , "invenimus manuscripta: ", element b { count($doc1) }, ". Ordinatum alphabetice per titulum." } ,
element div {
for $doc in $doc1
order by $doc/tei:msIdentifier/tei:placeName[1]
return
element blockquote { element title { "MS sig: " , data($doc/tei:msIdentifier/tei:idno) } ,

if(exists($doc//tei:author)) then 
element birth { element b { "A: "} , data($doc/tei:author),
 element b { " &#8212; A ID: " }, $doc/tei:author/tei:ref/@target/string() }
else(),

element blockquote { $doc }

}

}
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
