import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare function croala:flo() {
let $xml := element tbody { for $i in collection("croalabib")//*:listPerson[@type='croala.auctores']/*:person
let $period := 
if ($i/*:floruit/@period) then $i/*:floruit/@period
else if ($i/*:floruit/*:date/@period) then $i/*:floruit/*:date/@period
else()
group by $period
order by $period
return element tr { element td { replace($period, 'http://semium.org/time/', '') } , element td { count($i) } } }
return $xml
};
declare %rest:GET %rest:POST %rest:path("croalabib-floruit")
function page:croalabib-floruit() { 

(: Report number of authors writing prose, poetry etc. :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>CroalaBib: auctores per aetates</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: auctores per aetates</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

<blockquote>
<table>
    
    <thead>
      <tr>
          <td>Tempus</td>
          <td>Auctorum numerus</td>
      </tr>
    </thead>{ 
(: The actual XQuery starts here :)


 croala:flo()
 


}



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