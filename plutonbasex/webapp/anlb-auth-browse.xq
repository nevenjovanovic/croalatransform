(: analytic neo-latin - return author names and counts :)
import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
(: declare namespace tei = "http://www.tei-c.org/ns/1.0"; :)
(: declare default element namespace "http://www.tei-c.org/ns/1.0"; :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare %rest:GET %rest:POST %rest:path("anlb-auth-browse")
function page:anlb-auth-browse() { 

(: Report list of authors and number of works :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>ABNLT: auctores opera</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>ABNLT: auctores opera</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table style="table-layout: fixed; width: 100%">
    
    <thead>
      <tr>
          <td>Auctores</td>
          <td>Operum numerus</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $r := for $a in collection("anlb")//*:rc/*:a
let $n := distinct-values($a)
group by $n
order by $n
return element tr { 
element td {
   attribute style {"word-wrap: break-word"} ,
element name { element a { attribute href {concat('anlb-work-display?nomq=',data($n))}, replace($n, 'AUTHORS?:? *', '') } } } , 
element td {
element num { count($a) } }
}
return element tbody { 
element tr {
  element td { "Omnes: " , count($r)} ,
  element td { "Omnia opera: " , sum($r/td[2])}
} ,
$r }
}
</table>
</blockquote>
     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return