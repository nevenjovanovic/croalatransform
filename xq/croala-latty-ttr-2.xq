(: return for divs in both db's db, filename, node id, word count, type count, type-token-ratio :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
(: round a number :)
declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
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

let $index := element idx {
let $db := ("croala", "latty")
for $coll in $db
for $d in collection($coll)//*:text[not(descendant::*:text)]//*:div[not(descendant::*:div)]
let $period := string-join(
  for $p in $d/ancestor::*:TEI/descendant::*:profileDesc[1]/*:creation/*:date/@period return data($p)
  , ' ')
let $genre := string-join(
  for $g in $d/ancestor::*:TEI/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term return data($g)
  , ' ')
let $genretr := if (map:contains($genrelat,$genre)) then map:get($genrelat,$genre) else $genre
let $w := ft:tokenize($d)
let $wc := count($w)
let $types := distinct-values($w)
let $tc := count($types)
let $ttr := if ($wc ne 0) then croala:round2($tc, $wc) else "na"
return element d { 
element db { db:name($d) },
element path { db:path($d) } , 
element node { db:node-pre($d) },
element aet { $period },
element gen { $genretr },
element ttr { $ttr },
element wc { $wc },
element tc { $tc }}
}
return db:create("cl-idx",$index,"croala-latty-idx.xml")