import module namespace rest = "http://exquery.org/ns/restxq";

(: show word count in respective divs for both db's, with links to db nodes :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function croala:wc2 () { 
let $divs := element tbody { 
for $collection in ("croala" , "latty")
for $i in collection($collection)//*:text[not(ancestor::*:text)]
for $dc in $i//*:div[not(descendant::*:div)]
let $name := db:path($dc)
let $wc := count(ft:tokenize($dc))
order by $wc descending
return element tr { 
element td {
  attribute class { $collection },
  $collection
},
element td { 
element a { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $collection || "/" || db:node-pre($dc) },
  $name || ":" || db:node-pre($dc)
}
},
element td { attribute class {"clausula"} , $wc }
}

}
let $quot := 
for $q in $divs/tr
let $n := $q/td[3]
let $group := 
  if ($n > 10000) then "Verb. 10,000+"
  else if ($n < 10000 and $n >= 1000 ) then "Verb. 1,000-10,000"
  else if ($n < 1000 and $n >= 500) then "Verb. 500-1000"
  else if ($n < 500 and $n >= 100) then "Verb. 100-500"
  else if ($n < 100 and $n >= 50) then "Verb. 50-100"
  else if ($n < 50 and $n >= 1) then "Verb. 1-50"
  else if ($n = 0 ) then "Verba desunt"
  else() 
group by $group
return element tr { element td {} , element td { $group } , element td { 
attribute class {"clausula"} , count($q) } }

let $divcount := count($divs/tr)
let $divmax := max($divs/tr/td[3])
let $divmin := min($divs/tr/td[3])
return element blockquote { 
element p { "Elementa div numero sunt: " || $divcount || "." },
element p { "Longissimum div verba habet: " || $divmax || "." },
element p { "Brevissimum div verba habet: " || $divmin || "." },
element table { $quot },
element table {
element thead {
element tr {
  element td { "DB"},
  element td { "Textus: div"},
  element td { "Quot verba"}
}},
 $divs }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/numdiv/croalalatty")
  %rest:GET
  function page:quotverbadiv2()
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: quot verba in div in utraque</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: quot verba in div in utraque?</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaeritur in collectionibus CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>
    { croala:wc2() }
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

