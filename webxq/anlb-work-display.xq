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


declare %rest:GET %rest:POST %rest:path("anlb-work-display")
%rest:query-param("nomq", "{$nomq}")
function page:anlb-work-display($nomq as xs:string) { 

(: Report list of authors and number of works :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>ABNLT: opera omnia</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>ABNLT: opera omnia</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }. Iterum lege <a href="anlb-auth-browse">indiculum auctorum</a>.</p>

<blockquote>
<table>
    
    <thead>
      <tr><td>Nr.</td>
          <td>Nota bibliographica</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)
let $r := 
for $a at $count in collection("anlb")//*:rc[*:a=$nomq]
let $aut := $a/*:a
let $t := $a/*:t
let $st := $a/*:st
let $s := $a/*:s
let $addr := for $http in $a/*:u/*:ptr/@target[contains(.,'http')]
return element a {attribute href {$http} , replace($http, 'http://', '') }
let $nt := $a/*:n
return element tr { 
element td { $count },
element td {
   attribute style {"word-wrap: break-word"} ,
data(replace($t, 'TITLE *', '')),
element br {},
element a { replace($aut, 'AUTHORS?:? *', '')} ,
element br {},
replace($st, 'SITE *', ''), 
element br {} ,
$addr,
element br {},
replace(string-join($s, ' '), 'SUBJECT *', ''),
element br {},
replace($nt, 'NOTES?:? *', '') } 
}
return element tbody { 
element tr {
  element td {},
  element td { $nomq , "- operum: " , count($r)} 
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