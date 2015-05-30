import module namespace rest = "http://exquery.org/ns/restxq";

(: find ttr for a period, link to documents with ttr :)

declare namespace page = 'http://basex.org/examples/web-page';

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

(: round a number :)
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

declare function croala:ttrp1 ($aet) {
let $dbidx := "cl-idx"
let $vl := count(collection($dbidx)//d[db[.="latty"] and aet[contains(., $aet)]])
let $vc := count(collection($dbidx)//d[db[.="croala"] and aet[contains(., $aet)]])
let $ranges := for $values in
  let $ttr := distinct-values(collection($dbidx)//d/ttr)
  for $n in $ttr 
  return $n
let $v := collection($dbidx)//d[aet[contains(.,$aet)] and ttr[.=$values]]
let $cc := count($v/db[.="croala"])
let $cl := count($v/db[.="latty"])
order by number($values) descending
return if ($cc > 0 and $cl > 0) then element tr { 
element td { 
  element a { attribute href {"http://solr.ffzg.hr/basex/ttrdiv2/" || $values } , $values } }, 
element td { croala:round2($cl, $vl) }, 
element td { croala:round2($cc, $vc) }
 }
 else ()
return element blockquote {
  element p { "Aetas: " || $aet},
  element p { "Div in LatTy: " || $vl} ,
  element p {"Div in CroALa: " || $vc} ,
  element table { 
  element thead {
    element tr {
      element td { "TTR"},
      element td { "% div in LatTy"},
      element td { "% div in CroALa"}
    }
  },
  element tbody { $ranges } }
}
};

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/ttr/{$aet}")
  %rest:GET
  function page:ttraet1($aet)
{
  (: HTML template starts here :)

<html>
<head><title>CroALa &amp; LatTy: verba quaedam</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>CroALa &amp; LatTy: TTR in aetate</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus TTR (ratio lemmatum et verborum) in quadam aetate in textibus collectionum CroALa et LatTy.</p>
<p>Functio nominatur: {rest:uri()}.</p>

{ croala:ttrp1($aet) }

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