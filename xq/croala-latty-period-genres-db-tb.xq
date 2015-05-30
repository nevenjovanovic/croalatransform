declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: sort by periods; return genres, number and names of document; translate German genre names to Latin :)

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

for $docs in  (collection("croala")|collection("latty"))//*:profileDesc/*:creation/*:date[@period]
let $id := db:path($docs)
let $idlink := element a { attribute href {"http://solr.ffzg.hr/basex/" || db:name($docs) || "/opendoc/" || $id } , $id }
let $genre := string-join(for $g in $docs/ancestor::*:profileDesc/*:textClass/*:keywords[@scheme="genre"]/*:term return $g, ' ')
let $genretr := if (map:contains($genrelat,$genre)) then map:get($genrelat,$genre) else $genre
let $per := $docs/@period
  group by $per , $genretr
  order by $per , $genretr
return element tr {
  element td { distinct-values(for $d in $docs return db:name($d)) },
  element td { data($per) },
  element td { data($genretr) } ,
  element td { count($id) } ,
  element td { $idlink }
}