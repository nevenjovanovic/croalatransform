declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:solraddr ($auct) { 
let $link := "http://solr.ffzg.hr/cgi-bin/philologic/search3t?dbname=latty&amp;filename=HEREGENUS"
return replace($link,"HEREGENUS",$auct)
 };
 
 declare function croala:round2($a,$b) {
  round($a div $b * 100000) div 100
};
 
 declare function croala:ws ($coll,$w) {
   ft:count($coll//*[text() contains text {$w} ])
 };
 
 declare function croala:is-multiel ($terms) {
  if (some $str in $terms satisfies ($str[2]) ) then concat(data($terms) , ' ')
else data($terms)
};
 
 
 declare variable $genre as map(*) := map {
 "Brief": 41,
 "Dichtung": 0.1,
 "Epik" : 0.17,
 "Gelegenheitsdichtung": 0.6,
 "Lehrgedicht" : 0.16,
 "Geschichtsschreibung": 20.3,
 "Theater": 1,
 "poesis - carmen" : 0.1,
"poesis - carmen heroicum" : 0.15,
"poesis - cyclus" : 0.07,
"poesis - descriptio" : 0.13,
"poesis - didactica" : 0.16,
"poesis - ecloga" : 0.4,
"poesis - elegia" : 0.5,
"poesis - encomium" : 0.6,
"poesis - epica" : 0.17,
"poesis - epicedion" : 0.65,
"poesis - epigramma" : 0.7,
"poesis - epistula" : 0.51,
"poesis - epitaphium" : 0.651,
"poesis - epithalamium" : 0.61,
"poesis - fabula" : 0.8,
"poesis - fragmentum" : 0.01,
"poesis - hendecasyllabi" : 0.02,
"poesis - historia" : 0.171,
"poesis - hymnus" : 0.62,
"poesis - idyllium" : 0.41,
"poesis - inscriptio" : 0.71,
"poesis - lyrica" : 0.9,
"poesis - macaronicum" : 0.55,
"poesis - metamorphosis" : 0.51,
"poesis - ode" : 0.91,
"poesis - paraphrasis" : 0.06,
"poesis - paratextus poetici" : 0.02,
"poesis - poema" : 0.89,
"poesis - sapphicum" : 0.911,
"poesis - satura" : 0.52,
"poesis - sonetto" : 0.03,
"poesis - sylva" : 0.04,
"poesis - versio" : 0.05,
"poesis - versio - ex Graeco" : 0.051,
"poesis - versus intertexti" : 0.08,
"prosa oratio - acta" : 10,
"prosa oratio - acta iuridica" : 10.10,
"prosa oratio - acta officialia" : 10.20,
"prosa oratio - charta" : 10.30,
"prosa oratio - chorographia" : 20.10,
"prosa oratio - chronica" : 20,
"prosa oratio - commentarius" : 30,
"prosa oratio - dedicatio" : 40,
"prosa oratio - descriptio" : 20.20,
"prosa oratio - dialogus" : 50,
"prosa oratio - dialogus scholasticus" : 50.10,
"prosa oratio - diarium" : 60.00,
"prosa oratio - diploma" : 10.40,
"prosa oratio - donatio" : 10.50,
"prosa oratio - epistula" : 41.00,
"prosa oratio - epistula dedicatoria" : 40.40,
"prosa oratio - epistula - praefatio" : 40.50,
"prosa oratio - epitaphium" : 70.20,
"prosa oratio - epitome" : 21.00,
"prosa oratio - fabula" : 22.00,
"prosa oratio - historia" : 20.30,
"prosa oratio - historia litteraria" : 20.35,
"prosa oratio - inscriptio" : 42.00,
"prosa oratio - itinerarium" : 20.40,
"prosa oratio - lexicon" : 80,
"prosa oratio - libellus" : 90,
"prosa oratio - loci communes" : 80.20,
"prosa oratio - novella" : 22.20,
"prosa oratio - oratio" : 70.00,
"prosa oratio - oratio funebris" : 70.10,
"prosa oratio - parabola" : 22.30,
"prosa oratio - paratextus" : 43.00,
"prosa oratio - praefatio" : 43.10,
"prosa oratio - prosopographia" : 20.50,
"prosa oratio - relatio" : 19.70,
"prosa oratio - sermo" : 71.00,
"prosa oratio - testamentum" : 10.60,
"prosa oratio - tractatus" : 91.00,
"prosa oratio - versio" : 100.00,
"prosa oratio - vita" : 21.50,
"prosa oratio - vocabularium" : 80.10
};
 
let $cat := element tbody {
(: ratio of p's and l's in texts :)
for $i in //*:text[not(descendant::*:text)]
let $per := $i/ancestor::*:TEI//*:profileDesc[1]/*:creation/*:date[1]/@period
let $gen := croala:is-multiel($i/ancestor::*:TEI//*:profileDesc[1]/*:textClass/*:keywords[@scheme='genre']/*:term)
let $toks := ft:tokenize($i)
let $twc := count($toks)
let $hapax := count(
for $b in distinct-values($toks)
let $count := count(index-of($toks,$b))
where $count = 1
return $b )
let $rr := ( "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero", "et", "ac", "atque")
let $vrb := for $r in $rr 
return element td { croala:round2(croala:ws($i,$r), $twc) }
let $l := count(
  for $v in $i//(*:div[not(descendant::*:div)] | *:lg | *:sp)/*:l
return ft:tokenize($v)
)
let $p := count(
  for $p in $i//*:div[not(descendant::*:div)]/*:p 
  return ft:tokenize($p))
  
return element tr {
  element td {
    element a {
      attribute href {
    croala:solraddr(substring-after(base-uri($i), "/"))
  },
  substring-after(base-uri($i), "/")
}
  },
  element td { db:node-pre($i) || substring-before(db:path($i), ".xml") } ,
  element td { fn:number(replace(data($per), '[^0-9]', '')) div 10 } ,
  element td { sum(for $a in $gen return map:get($genre,$a)) } ,
  element td {
    if ($l eq 0) then "-1"
    else if ($p eq 0 ) then "1"
    else if ( $l gt $p ) then "0.5"
    else if ( $p gt $l ) then "-0.5"
    else ("NA")
  },
  element td { $hapax div 100 },
  $vrb (: ,
  element td {
    if ($l eq 0) then "PROSA - NIHIL POESEOS"
    else if ($p eq 0 ) then $l
    else if ( $l div $p gt $p div $l ) then $l
    else "PROSA ET " || $l
  },
  element td {
    if ($p eq 0) then "POESIS - NIHIL PROSAE"
    else if ($l eq 0 ) then $p
    else if ($p div $l gt $l div $p ) then $p
    else "POESIS ET " || $p
  } :)
    
}
}

return csv:serialize($cat)

(: let $d := if (//*:text[descendant::*:sp]) then count(//*:text[descendant::*:sp])
else "NULLUM"
return element blockquote {
  element p { "POESIS: " || count($cat//td[contains(., "POESIS")]) || ", PROSA: " || count($cat//td[contains(., "PROSA ")]) || ", DRAMA: " || $d },
  element table {
  $cat
}
} :)