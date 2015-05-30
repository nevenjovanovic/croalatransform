(: count verses in genres :)

declare variable $genrelat as map(*) := map {
 "Brief": "prosa oratio - epistula",
 "Dichtung": "poesis",
 "Epik" : "poesis - epica",
 "Gelegenheitsdichtung": "poesis - sylva",
 "Lehrgedicht" : "poesis - didactica",
 "Geschichtsschreibung": "prosa oratio - historia",
 "Theater": "poesis - drama"
};

for $coll in ("latty","croala")
let $doccount := count(collection($coll)/*)
for $genre in distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term)
let $i := collection($coll)/*[descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term[.=$genre]]//*:text[not(descendant::*:text)]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
where count($i) > 0
order by count($i) descending
return element ln { 
attribute c { $coll } ,
if (map:contains($genrelat,$genre)) then map:get($genrelat,$genre)  || ": " ||
count($i) else $genre || ": " ||
count($i) }
