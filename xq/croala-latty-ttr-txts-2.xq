(: create ttr index for croala and latty texts as database :)
(: include types, genres (Latin terms), period, div count :)
(: executes in about 7536 ms :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:is-multiel ($terms) {
  if (some $str in $terms satisfies ($str[2]) ) then concat(data($terms) , ' ')
else data($terms)
};

declare variable $genrelat as map(*) := map {
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
};


let $idx := element idx {
for $dbs in ("latty", "croala")
  let $nodes :=
  for $i in collection($dbs)/*:TEI
  let $authkey := for $a in $i/*:teiHeader//*:titleStmt/*:author/@key
  return distinct-values($a)
  let $per := replace($i//*:profileDesc[1]/*:creation/*:date[1]/@period, '_third', '')
  let $typus := for $terms in $i//*:profileDesc/*:textClass/*:keywords[@scheme='typus']/*:term
              return croala:is-multiel($terms)
  let $genre := for $terms2 in $i//*:profileDesc/*:textClass/*:keywords[@scheme='genre']/*:term
              return croala:is-multiel($terms2)
  let $genretr := for $g in $genre return if (map:contains($genrelat,$g)) then map:get($genrelat,$g) else $g
  for $t in $i//*:text[not(descendant::*:text) and descendant::text()]
  return element n { element nd { db:node-pre($t) } , 
  element a { $authkey } , 
  element per { $per} , element typ { distinct-values($typus) } , element gen { distinct-values($genretr) } }
for $n in $nodes
  let  $div := db:open-pre($dbs, $n/nd)
  let $a := $n/a
  let $per := $n/per
  let $typ := $n/typ
  let $gen := $n/gen
  let $divc := count($div//*:div[not(descendant::*:div)])
  let $tok := ft:tokenize($div)
  let $tokc := count($tok)
  let $typc := count(distinct-values($tok))
  return element div { 
    element db { db:name($div)},
    element id { db:node-pre($div)},
    element name { db:path($div)},
    $a ,
    $per ,
    $typ ,
    $gen ,
    element divc { $divc } ,
    element tok { $tokc } ,
    element typ { $typc },
    element ttr { if ($tokc gt 0) then round($typc div $tokc * 100) div 100 else () }
 }
}
return  db:create("croalalattywc2-txts", $idx, "croala-latty-txts.xml")