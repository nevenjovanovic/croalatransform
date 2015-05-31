module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: concatenate multiple entries :)
declare function croala:is-multiel ($terms) {
  if (some $str in $terms satisfies ($str[2]) ) then concat(data($terms) , ' ')
else data($terms)
};



(: total wcs, nicely formatted :)
declare function croala:wcsve ($db) {
  format-number(
  sum(for $i in collection($db)//*:text[not(descendant::*:text)]
  return count(ft:tokenize($i)) ), "#,##0")
};

(: make link to query in philologic / croala :)
declare function croala:philo01 ($qw, $qfile) { 
let $qstring := "http://croala.ffzg.unizg.hr/cgi-bin/search3t?dbname=croala&amp;word=REPLACEWORDXXX&amp;OUTPUT=conc&amp;&amp;CONJUNCT=PHRASE&amp;DISTANCE=3&amp;title=&amp;author=&amp;period=&amp;genre=&amp;DFPERIOD=1&amp;POLESPAN=5&amp;THMPRTLIMIT=1&amp;KWSS=1&amp;KWSSPRLIM=500&amp;trsortorder=author%2C+title&amp;dgdivhead=&amp;dgdivtype=&amp;dgdivlang=&amp;dgdivocauthor=&amp;dgdivocdateline=&amp;dgdivocsalutation=&amp;dgsubdivtag=&amp;filename=REPLACEFILEXXX"
return
  attribute href { replace(replace($qstring, 'REPLACEWORDXXX', $qw), 'REPLACEFILEXXX', $qfile) } 

 };

(: make link to file in philologic :)
declare function croala:solraddr ($db, $txtnode) { 
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/" || data($txtnode) } 

 };
(: make link to file in philologic :)
declare function croala:localnode ($db, $txtnode) { 
  attribute href { "/basex/node/" || $db || "/" || data($txtnode) } 

 };

(: return counts for individual texts, order by word count descending :)
declare function croala:wc () { 
for $dc in collection("croalalattywc2-txts")//div
let $db := data($dc/db)
let $name := data($dc/name)
let $txtnode := data($dc/id)
let $wc := xs:integer($dc/tok)
order by $wc descending
return element tr { 
element td {
  attribute class { $db },
  $db
},
element td { 
element a { 
  croala:solraddr($db, $txtnode),
  $name
}
},
element td { attribute class {"clausula"} , format-number($wc, "#,##0") }
}
};

declare function croala:ttrfilter ($time , $x , $y ) {
  
  (: filter index database on period and ttr :)
let $csv := 
element table {
  attribute class { "table-striped  table-hover table-centered"},
element thead {
  element tr {
    element td { "TTR" },
    element td { "Div"},
    element td { "Div in CroALa"},
    element td { "Doc in CroALa"},
    element td { "Div in LatTy"},
    element td { "Doc in LatTy"},
    element td { "Sectiones lege in periodo " || $time }
  }
},
element tbody { for $i in collection("cl-idx-divs")//div[contains(per,$time)]
let $ttr := round(number($i/ttr) * 10) div 10
where $ttr lt $y and $ttr gt $x
group by $ttr
order by $ttr descending
return element tr { 
element td { $ttr } , 
element td {
  attribute class {"clausula"} , 
  count($i)} , 
element td { 
  attribute class {"clausula"} , 
  count($i/db[.="croala"])},
element td { 
  attribute class {"clausula"} , 
  count(distinct-values($i[db="croala"]/name )) } , 
element td { 
  attribute class {"clausula"} , 
  count($i/db[.="latty"])}, 
element td { 
  attribute class {"clausula"} , 
  count(distinct-values($i[db="latty"]/name )) },
element td {
  element a {
    attribute href { "/basex/ttr2/" || $time || "/" || $ttr },
  "Sectiones ubi TTR est " || $ttr || "."
}
}
  }
}
}
return $csv

};

declare function croala:ttrfiltershow ($time , $x ) {
  
  (: show links to divs filtered for period and ttr in croala and latty :)
let $csv := 
element table {
  attribute class { "table-striped  table-hover table-centered"},
element thead {
  element tr {
    element td { "DB" },
    element td { "Doc"},
    element td { "Verborum numerus"},
    element td { "Lemmatum numerus"}
  }
},
element tbody { for $i in collection("cl-idx-divs")//div[contains(per,$time)]
let $ttr := round(number($i/ttr) * 10) div 10
let $tok := number($i/tok)
where $ttr eq $x
order by $tok descending
return element tr { 
element td {  
  attribute class {data($i/db)} , 
  $i/db } , 
element td {
  element a {
    croala:localnode(data($i/db),data($i/id)) ,
  data($i/name)
} } ,
element td { 
  attribute class {"clausula"} , 
  $i/tok } , 
element td { 
  attribute class {"clausula"} , 
  $i/typ}
  }
}
}
return $csv

};

(: count verses and words in verses in documents :)
declare function croala:versecount() {
let $db := ("croala", "latty")
for $d in $db
for $t in collection($d)//*:text[not(descendant::*:text) and descendant::*:l[not(ancestor::*:note)]]
let $name := db:path($t)
let $id := db:node-pre($t)
let $ll := $t//*:l[not(ancestor::*:note)]
let $lc := count($ll)
let $lwc := count(for $stih in $ll return ft:tokenize($stih))
order by $lc descending , $lwc descending
return element tr {
  element td {
      attribute class { $d },
    $d
  },
  element td {
     element a {
    croala:localnode($d,data($id)) ,
    $name
  }
  },
  element td {
    attribute class {"clausula"} , 
    format-number($lc, "#,##0")
  },
  element td {
    attribute class {"clausula"} , 
    format-number($lwc, "#,##0")
  }
}
};

declare function croala:versussaec1 () {
  (: count verses and words in verses in documents :)
let $db := ("latty", "croala")
for $d in $db
for $t in collection($d)//*:TEI[descendant::*:l]
let $dbn := db:name($t)
let $saec := replace($t//*:profileDesc[1]/*:creation/*:date[1]/@period, '_third', '')
let $lc := count($t//*:l)
let $lwc := count(for $w in $t//*:l return ft:tokenize($w))
group by $dbn , $saec
order by $saec
return element tr {
  element td {
      attribute class { $dbn },
    $dbn
  },
  element td {
    element a { 
attribute href { "/versus/" || $saec } ,
    $saec
  }
  },
  element td {
    attribute class {"clausula"} , 
    count($d)
  },
  element td {
    attribute class {"clausula"} , 
    format-number(sum($lc), "#,##0")
  },
  element td {
    attribute class {"clausula"} , 
    format-number(sum($lwc), "#,##0")
  }
}

};

declare function croala:translate($g) {
  let $genrelat := map {
 "Brief": "prosa oratio - epistula",
 "Dichtung": "poesis",
 "Dichtung Gelegenheitsdichtung": "poesis poesis - sylva",
 "Dichtung Lehrgedicht": "poesis poesis - didactica",
 "Dichtung Epik": "poesis poesis - epica",
 "Epik" : "poesis - epica",
 "Gelegenheitsdichtung": "poesis - sylva",
 "Lehrgedicht" : "poesis - didactica",
 "Geschichtsschreibung": "prosa oratio - historia",
 "Theater": "poesis - drama"
}
return if (map:contains($genrelat,$g)) then map:get($genrelat,$g) else $g
};

(: find all docs with verses in a period :)
declare function croala:versusperiodx ($x) {
  (: count verses and words in verses in documents :)


let $db := ("latty", "croala")
for $d in $db
for $t in collection($d)//*:TEI[descendant::*:l]
where $t//*:profileDesc[1]/*:creation/*:date[1]/@period[contains(.,$x)]
let $n := db:path($t)
let $aet := $t//*:profileDesc[1]/*:creation/*:date[1]/@period
let $typus := for $terms in $t//*:profileDesc/*:textClass/*:keywords[@scheme='typus']/*:term
              return croala:is-multiel($terms)
let $genre := for $terms2 in $t//*:profileDesc/*:textClass/*:keywords[@scheme='genre']/*:term
              return croala:is-multiel($terms2)
let $genretr := for $g in $genre return croala:translate($g)
let $id := db:node-pre($t)
let $lc := count($t//*:l)
let $lwc := count(for $w in $t//*:l return ft:tokenize($w))
order by data($aet) , $lc descending
return element tr {
  element td {
      attribute class { $d },
    $d
  },
  element td {
    replace(data($aet), 'third', 'tertia')
  },
  element td {
    element a {
    croala:solraddr($d,$id) ,
    $n }
  },
  element td {
    $typus
  },
  element td {
    $genretr
  },
 
  element td {
    attribute class {"clausula"} , 
    format-number(sum($lc), "#,##0")
  },
  element td {
    attribute class {"clausula"} , 
    format-number(sum($lwc), "#,##0")
  }
}

};

declare function croala:listclaus ($db , $dbc ) {
  (: return a list of clausulae in dbc for a db :)
for $a in collection($dbc)//c
return element tr { 
element td {
element a {
  attribute href { "http://solr.ffzg.hr/basex/node/" || $db || "/"  || data($a/@id) },
$db }
},
element td { 
attribute class {"clausula"} , data($a) }
}
};

(: use text index of db to find literally repeated clausulae :)
declare function croala:repetclaus ($dbc) {
  for $a in index:texts($dbc)
  where $a[xs:integer(@count) gt 1]
  order by xs:integer($a/@count) descending
  return element tr { 
  element td { data($a/@count) } ,
  element td { data($a) } 
}
};

(: formatting - footer :)
declare function croala:footer () {
let $f := <footer class="footer">
<div class="container">
<h3> </h3>
<h1 class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> <a href="http://solr.ffzg.hr/dokuwiki/doku.php/start">Croatica et</a> Tyrolensia</h1>
<div class="row">
<div  class="col-md-3">
<a href="http://www.ukf.hr/"><img src="/basex/static/gfx/ukflogo.gif"/></a></div> 
<div  class="col-md-6">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="/basex/static/gfx/ffzghrlogo.png"/> Filozofski fakultet</a> Sveučilišta u Zagrebu</p> 
<p class="text-center">Ludwig Boltzmann <a href="http://neolatin.lbg.ac.at/">Institut für Neulateinische Studien, Innsbruck</a> <img src="http://lbicr.lbg.ac.at/files/sites/lbicr/images/bildlogo_farbe_weiss.jpg" width="60"/></p></div>
<div  class="col-md-3"><p  class="text-center"><a href="https://www.tirol.gv.at/bildung/wissenschaftsfonds/"><img src="/basex/static/gfx/tirollogo.png"/></a></p></div></div>
</div>
</footer>
return $f
};

(: formatting - footer :)
declare function croala:footerhomer () {
let $f := <footer class="footer">
<div class="container">
<h3> </h3>
<h1 class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> <a href="http://www.ffzg.unizg.hr/klafil">Odsjek za </a> klasičnu filologiju</h1>
<div class="row">
<div  class="col-md-6">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="/static/gfx/ffzghrlogo.png"/> Filozofski fakultet</a> Sveučilišta u Zagrebu</p> </div>
</div>
</div>
</footer>
return $f
};


declare function croala:facet ( $naziv ) {
  let $map := map {
    "zapisi" : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]',
    "autori" : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:author',
    "osobe" : '//*:body/*:listBibl[@type="croala.drama"]//*:persName',
    'organizacije' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:orgName', 
    'razdoblja' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:date/@period', 
    'datumi' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:date', 
     'naselja' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:placeName',
     'lokacije' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:address',
    'bibliografija' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:relatedItem/*:listBibl/*:bibl', 
   'RHK' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:ref', 
   'naslovi_latinski' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="lat" and text()]', 
  'naslovi_hrvatski' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="hrv" and text()]',
   'bibliografija_naslovi' : '//*:body/*:listBibl[@type="croala.drama.sekundarna"]/*:bibl',
    'osobe' : '//*:body/*:listBibl[@type="croala.drama"]//*:persName'
  }
  let $i := xquery:eval(map:get($map,$naziv), map { '': db:open('croalabib', 'manifestacije/tisak/drame.xml') })
for $ci in distinct-values($i)
let $cic := count($i[.=$ci])
order by $ci collation "?lang=hr"
return element div { 
  attribute class { "col-md-3"},
  element code { $ci || " (" || $cic || ")" 
}

}
};

declare function croala:facet2 ( $expr, $naziv ) {
  let $i := xquery:eval($expr, map { '': db:open('croalabib', 'manifestacije/tisak/drame.xml') })
let $cname := $naziv
let $ci := count(distinct-values($i))
return element div {
  attribute class { "col-md-3"} ,
  element code { 
  element a { croala:facetlink($cname) } , " (" || $ci || ")" }
}
};

(: make link to next facet :)
declare function croala:facetlink ($naziv) { 
  attribute href { "/basex/croalabib2/facet/" || $naziv } , $naziv

 };
 
(: script for tablesorter :)
declare function croala:tablescript () {
  let $script := element script {
    "$(function(){
  $('#myTable').tablesorter();
});"
    }
    return $script
};

 (: make link to next sentence :)
declare function croala:homersent2 ($naziv) { 
  attribute href { "/basex/homer/" || $naziv } , $naziv

 };
 
 declare function croala:homerlist1 ($file) {
   for $i in db:open('ilias6', $file)//*:seg
   let $adr := $i/@corresp
   return element li {
      element a { croala:homersent2(data($adr))}
}
 };
 
 declare function croala:homerlist2 ($urn) {
   for $i in db:open('ilias6')//*:seg[@corresp=$urn]
   return element div { 
   attribute class { "row"} ,
   element code {
   for $txt in $i//*:l//text()[parent::*:l or parent::*:corr]
   return   concat($txt, ' ')
} }
 };
