import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";
declare 
  
%rest:path("imena-ok") 
function page:success() {
  <html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Imena in LatTy</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>LatTy: imena</h1>
<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-dateTime() }. Iterum lege <a href="static/alatyr-nomina-pura.html">indiculum nominum</a>.</p>
<blockquote>
{
  element div { attribute class {"table"}, 
  element div { element div {attribute class {"thead"}, "Uspješno promijenjeno!"} } 
} ,
  element p { element a { attribute href {"imena-display?nomq=22"}, "Natrag"}, "."}
}
</blockquote>
     <p/>
<hr/>
<div>
<p>Croatica et Tyrolensia</p>
</div>
</body>
</html>
};
declare
  %rest:POST
  %rest:path("imena-update")
  %updating
  %rest:query-param("nomq2", "{$nomq2}")
  %rest:query-param("type", "{$type}")
  %rest:query-param("lemma", "{$lemma}")
  function page:imena-update($nomq2, $type, $lemma)
{
  (: update node with attribute @type :)
  let $a := collection('imena')//*:nom[text()=$nomq2]
  return
   if ($a[not(@*)]) then 
   (db:output(page:success()),
     insert node (
    attribute { 'type' } { $type },
    attribute {'lemma'} { $lemma } ,
    attribute {'resp'} {'neven'} ,
    attribute {'date'} { current-dateTime() }) into $a
    
  )
    else()
};
return