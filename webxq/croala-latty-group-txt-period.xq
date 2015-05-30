import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
(: report number of texts by period in both db's -- add: link to list of texts :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: html output :)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
(: local functions :)
declare function croala:groupbyper ($coll) { 
for $i in collection($coll)//*:profileDesc/*:creation/*:date[1][@period]
  let $per := $i/@period
  group by $per
  order by $per
return 
  element tr { 
    element td { data($per) } , 
    element td { 
      element b { count($i) } } }
 };
declare function croala:saecula () { 
element t { 
(: recur to make centuries and their thirds :)
for $x in 9 to 19
for $y in 1 to 3
return element td { fn:format-number($x, "00") || "xx_" || $y || "_third" }
}
};
declare function croala:join ($saecula,$xml) {
  element tbody { 
  for $a in $saecula/td
  return 
    if ($a[text()=$xml/tr/td[1]/text()]) then $xml/tr[td[1][text()=$a/text()]]
    else element tr { $a , element td { "0" }}
}
};
declare function croala:clbody () { 
let $saecula := croala:saecula()
(: get data from a text collection :)
let $xml := element csv { croala:groupbyper("latty") }
(: join centuries table and text data :)
let $rez := croala:join($saecula,$xml)
let $xml1 := element csv { croala:groupbyper("croala")}
let $rez1 := croala:join($saecula,$xml1)
for $j in $rez/tr[td[1]=$rez1/tr/td[1]]
return element tr { 
 element td {
   element a {
     attribute href { "http://solr.ffzg.hr/basex/croalalatty/" || data($j/td[1]) || "/docs" } ,
     data($j/td[1]) }
   } , 
 $rez1/tr[td[1]=$j/td[1]]/td[2] , 
 $j/td[2] 
}
};

declare %rest:GET %rest:POST %rest:path("croala-latty-txt-period")
function page:croala-latty-grp() { 

(: Report a breakdown of texts by period in CroALa and LatTy :)
(: Present result as a HTML page :)


(: HTML template starts here :)

<html>
<head><title>CroALa et LatTy: documenta per saecula</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa et LatTy: documenta per saecula</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }.</p>

<blockquote>
<p>Documenta per saecula in CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<table>
<thead>
<tr>
<td>Saeculum</td>
<td>CroALa</td>
<td>LatTy</td>
</tr></thead>
<tbody>{ croala:clbody() }</tbody>
</table>

</blockquote>
     <p/>
<hr/>
<div>
<p><a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et Tyrolensia</a>
<a href="http://www.ukf.hr/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/znanjepomocen.jpg?cache="/></a> <a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/tirollogo.png?cache="/></a></p>
</div>
</body>
</html>
};
return
