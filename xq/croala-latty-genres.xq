(: return number and names of documents in certain genres; translate German genre names to Latin :)

declare variable $genrelat as map(*) := map {
 "Brief": "prosa oratio - epistula",
 "Dichtung": "poesis",
 "Epik" : "poesis - epica",
 "Gelegenheitsdichtung": "poesis - sylva",
 "Lehrgedicht" : "poesis - didactica",
 "Geschichtsschreibung": "prosa oratio - historia",
 "Theater": "poesis - drama"
};

let $genper := element genper { 
for $coll in ("latty" , "croala")
let $genre := distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term)
for $b in $genre
let $docs := for $i in collection($coll)/*:TEI[descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term[.=$b]]
return $i

return element tr { 
element td {
attribute class { $coll } ,
$coll
},
element td { attribute class { "genre" } , if (map:contains($genrelat,$b)) then map:get($genrelat,$b) else $b } ,
element td { count( $docs ) } ,
element td { for $d in $docs return db:path($d) }
}
 }

return element table { 
element thead { 
element tr {
  element td { "DB"},
  element td { "Genus"},
  element td { "Quot"},
  element td { "Documenta"}
} },
element tbody {
for $g in $genper//*:tr
order by $g/*:td[@class='genre']
return $g
 }
}