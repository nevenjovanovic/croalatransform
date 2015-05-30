(: return duplicate clausulae from latty Latin l elements :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: create address for PhiloLogic search :)
declare function croala:solraddr ($auct) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=latty&amp;word=HEREGENUSSSS"
return replace($link,"HEREGENUSSSS",$auct)
 };

(: get filename and count for matches of clausulae in db :)
declare function croala:srcclaus ($coll, $r) {
  let $rcc1 :=
    for $rcc in collection($coll)//*:l[. contains text {$r}]
    return
     db:path($rcc)
    let $countrcc1 := count($rcc1)
    return element td { $countrcc1 || ": " || string-join($rcc1, ', ') }
};

(: get clausulae, extract duplicates :)
declare function croala:duptab () { 
let $repetit := element r { 
let $claus :=
for $i in collection("latty")//*:TEI//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return element l {
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])]
}
return
let $aa := 
for $e in $claus 
return element c { ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
  
return $aa[not(index-of($aa, .)[2])]
}
let $rc := count($repetit/c)
return element table {
  element thead {
    element tr {
      element td { "Inventae sunt clausulae repetitae numero: " || $rc || "."}
    },
    element td { "In LatTy"},
    element td { "In CroALa" }
  },
  element tbody {
for $r in $repetit/c
order by $r
return 
  element tr {
    element td {
      element a {
      attribute href { croala:solraddr(replace(data($r), ' ', '+')) } ,
      data($r)
    } ,
     croala:srcclaus ("latty", $r)
  ,
   
     croala:srcclaus ("croala", $r)
  
    }
  }}
}

};

(: return final results as HTML page :)
declare function croala:ppp () {
   (: HTML template starts here :)

<html>
<head><title>LatTy: poesis prosa drama</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="../static/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
</head>

<body text="#000000">
<h1>LatTy: clausulae repetitae</h1>

<p><a href="http://www.ffzg.unizg.hr/klafil/croala">CroALa</a>, { current-date() }. Quaerimus in collectione latty.</p>


<blockquote> { croala:duptab() }</blockquote>

   
     <p/>
<hr/>
<div>
<p><a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et Tyrolensia</a>
<a href="http://www.ukf.hr/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/znanjepomocen.jpg?cache="/></a> <a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="http://solr.ffzg.hr/dokuwiki/lib/exe/fetch.php/tirollogo.png?cache="/></a></p>
</div>
</body>
</html>
};
 croala:ppp()
