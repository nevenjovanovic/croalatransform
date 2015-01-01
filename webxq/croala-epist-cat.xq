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

declare %rest:GET %rest:POST %rest:path("croala-epist-cat")
function page:croala-epist-cat() { 

(: Return list of documents in CroALa containing letters :)
(: Output result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroALa: epistulae</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/croalabib.css"/>
</head>

<body text="#000000">
<h1>CroALa: epistulae</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/dokuwiki/doku.php/z:croatica-et-tyrolensia">Croatica et Tyrolensia</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>
<p>Functio nominatur: {rest:uri()}</p>

{ 
(: The actual XQuery starts here :)

element table {
element thead {
    element tr {
      element th {"Num"},
      element th {"Nom"},
      element th {"Tit"},
      element th {"CroALa"}
    }
  },
  
  
  element tbody {
  let $tbl :=
element a {
for $doc in collection('croala')
let $serv := "http://solr.ffzg.hr/basex/rest/croala/"
let $cro := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=croala&amp;filename="
    where contains(document-uri($doc), 'epist') or $doc//*:term[contains(text(), 'epist')]
    order by document-uri($doc)
return
element tr {
element td { 
element a { 
attribute href {concat($serv, substring(document-uri($doc), 8))} , 
substring(document-uri($doc), 8) }
} ,
element td {
data($doc//*:titleStmt/*:title)
} ,
element td {
element a {
attribute href {
concat($cro,substring(document-uri($doc), 8))
},
"Txt"
}
}
}
}
return for $td at $broj in $tbl//tr
return element tr { 
element td { $broj } , $td/td }
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
