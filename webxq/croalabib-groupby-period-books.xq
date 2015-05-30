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
declare function croala:libtot(){
  let $i := collection("croalabib")//*:listBibl[@type='croala.libri']/(*:bibl|*:biblStruct)
  return count($i)
};
declare function croala:flo() {
let $xml := element tbody { 
for $i in collection("croalabib")//*:listBibl[@type='croala.libri']/(*:bibl|*:biblStruct)
let $period := if ($i[self::*:bibl]) then $i/*:date[1]/@period
else if ($i[self::*:biblStruct]) then $i//*:date[parent::*:imprint][1]/@period
else()
group by $period
order by $period
return element tr { element td { $period } , element td { count($i) } }
 }
return $xml
};
declare %rest:GET %rest:POST %rest:path("croalabib-lib-per")
function page:croalabib-lib-per() { 

(: Report number of books written in thirds of centuries :)
(: Printed books are in listBibl / bibl/biblStruct :)
(: Present result as a HTML page :)


(: HTML template starts here :)

<html>
<head><title>CroalaBib: libri per aetates</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroalaBib: libri per aetates</h1>

<p><a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et Tyrolensia</a>, { current-date() }.</p>

<blockquote>
<p>Librorum numerus: { croala:libtot() }.</p>
<table>
    
    <thead>
      <tr>
          <td>Tempus</td>
          <td>Librorum numerus</td>
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