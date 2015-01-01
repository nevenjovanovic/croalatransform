(: Tyrolean names - annotate name as person / place / other :)
import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
(: declare namespace tei = "http://www.tei-c.org/ns/1.0"; :)
(: declare default element namespace "http://www.tei-c.org/ns/1.0"; :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare namespace functx = "http://www.functx.com";


declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare function functx:capitalize-first
  ( $arg as xs:string? )  as xs:string? {

   concat(upper-case(substring($arg,1,1)),
             substring($arg,2))
 } ;


declare %rest:GET %rest:POST %rest:path("imena-display")
%rest:query-param("nomq", "{$nomq}")
function page:imena-display($nomq as xs:integer) { 

(: Present form with name and types :)
(: Present result as a HTML page :)
(: Output date using Linux 'date -I' command :)



(: HTML template starts here :)

<html>
<head><title>Imena in LatTy</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>LatTy: imena</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-dateTime() }. Iterum lege <a href="static/alatyr-nomina-pura.html">indiculum nominum</a>.</p>

<blockquote>
 <div class="table">
      <div><div class="thead">Nr.</div>
          <div class="thead">Nomen</div>
          <div class="thead">Persona?</div>
          <div class="thead">Locus?</div>
          <div class="thead">Aliud?</div>
          <div class="thead">Lemma?</div>
          <div class="thead">Actio</div>
      </div>
    { 
(: The actual XQuery starts here :)
for $a in collection("imena")//*:nom[position()=$nomq to ($nomq + 10)][not(@*)]
return element form { 
attribute action { "imena-update" }, 
attribute method {"POST"},
element div { db:node-pre($a) },
element div {
  element input {
    attribute type {"hidden"},
    attribute name {"nomq2"} ,
    attribute value {data($a)}
  },
data($a)

},
element div {
  element input {
    attribute type {"radio"}, 
    attribute name {"type"},
    attribute value {"person"}
  }
},
element div {
  element input {
    attribute type {"radio"}, 
    attribute name {"type"},
    attribute value {"place"}
  }
},
element div {
  element input {
    attribute type {"radio"}, 
    attribute name {"type"},
    attribute value {"other"}
}
},
element div {
  element input {
    attribute type {"text"}, 
    attribute name {"lemma"},
    attribute value { functx:capitalize-first(data($a)) }
}
},

element div {
  element input {
    attribute type {"submit"},
    attribute value {"Scribatur"}
  }
}
}
}

</div>
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