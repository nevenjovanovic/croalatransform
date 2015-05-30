import module namespace rest = "http://exquery.org/ns/restxq";

(: show ratio of poetry and prose in latty texts :)

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

declare function croala:solraddr ($coll,$auct) { 
let $link := "http://solr.ffzg.hr/basex/node/" || $coll || "/" || $auct
return $link
 };
 
declare function croala:poepros ($coll) { let $cat := element tbody {
(: ratio of p's and l's in texts :)
for $i in collection($coll)//*:text[not(descendant::*:text)]
let $l := count($i//(*:div[not(descendant::*:div)] | *:lg[not(descendant::*:lg)] | *:sp[not(descendant::*:sp)])/*:l)
let $p := count($i//*:div/*:p[not(descendant::*:p)])

order by $l descending , $p descending
return element tr {
  element td {
    element a {
      attribute href {
    croala:solraddr($coll,db:node-pre($i))
  },
  db:path($i)
}
  },
  element td {
    if ($l eq 0) then "PROSA - NIHIL POESEOS"
    else if ($p eq 0 ) then $l
    else if ( $l div 10 gt $p ) then $l
    else "PROSA ET " || $l || " VERSUS"
  },
  element td {
    if ($p eq 0) then "POESIS - NIHIL PROSAE"
    else if ($l eq 0 ) then $p
    else if ($p gt $l div 10 ) then $p
    else "POESIS ET " || $p || " PARAGRAPHI"
  }
    
}
}
let $d := if (collection($coll)//*:text[descendant::*:sp]) then count(collection($coll)//*:text[descendant::*:sp])
else "NULLUM"
return element blockquote {
  element p { "POESIS: " || count($cat//td[contains(., "POESIS")]) || ", PROSA: " || count($cat//td[contains(., "PROSA ")]) || ", DRAMA: " || $d },
  element table {
    element thead {
      element tr {
        element td {"Documentum"},
        element td {"Versus"},
        element td {"Prosae paragraphi"}
      }
    },
  $cat
}
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/{$coll}/poepros")
  %rest:GET
  function page:poepros($coll)
{
  (: HTML template starts here :)

<html>
<head><title>{$coll}: poesis prosa drama</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>{$coll}: poesis prosa drama</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectione {$coll}.</p>
<p>Functio nominatur: {rest:uri()}.</p>



    { croala:poepros($coll) }
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
