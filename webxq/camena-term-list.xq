(: CAMENA TERMINI - count all entries, show a subset :)
import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: count number of rows / term entries :)
declare function croala:cnt () {
  count(collection("camenatermini")/table/tr)
};

(: return count of entries beginning with particular letter :)
declare function croala:cnt-slovo ($slovo) {
  count(
    for $a in collection("camenatermini")/table/tr
  where starts-with(data($a/td[1]/b), $slovo)
  return count($a)
)
};

(: link for CroALa / solr :)
declare function croala:link ($term) {
  replace ("http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=croala&amp;word=REPLACEXXX&amp;OUTPUT=kwic", "REPLACEXXX", $term)
};

declare function croala:abc ($slovo) {
  let $sorted := for $a in collection("camenatermini")/table/tr
  where starts-with(data($a/td[1]/b), $slovo)
  order by $a/td[1]/b
  return $a
  for $a at $count in subsequence($sorted, 1, 20)
  return
  element tr { 
  element td { data($a/td[1]/b) } ,
  element td {
    element a {attribute href {data($a/td[3]/a/@href)} , "Termini"}
  },
  element td {
    element a {attribute href {croala:link(
      replace(
        replace(data($a/td[1]/b), "V", "U"), "\s\[.+", ""
      ))} , "CroALa"}
  }
}
};


declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";


declare %rest:GET %rest:POST %rest:path("camenaterm-l")
function page:camenaterm-l() { 

(: Report number of terms and all terms beginning with a letter :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)

(: HTML template starts here :)

<html>
<head><title>CAMENA TERMINI: indiculus</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CAMENA TERMINI: indiculus</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { replace(proc:system('date', '-I'), '\n', '') }.</p>

{
let $slovo := "C"
return element div { 
  element div { attribute class {"table thead"} , element tr { 
  element td { "Termini omnes: " } , element td { croala:cnt() } 
} ,
  element tr { element td { "Termini sub littera ", $slovo , ":" } , element td { croala:cnt-slovo($slovo) }
}
},
  element table { 
   croala:abc($slovo) }
}
}
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
return