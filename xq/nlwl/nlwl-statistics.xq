declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

declare variable $genera as map(*) := map {
  "noun": "Nomina", 
  "verb": "Verba", 
  "adjective": "Adiectiva", 
  "adverb": "Adverbia", 
  "particle": "Particulae", 
  "preposition": "Praepositiones"
};

let $poslist := element tbody {
for $pos in ("noun", "verb", "adjective", "adverb", "particle", "preposition")
let $nlwl := collection("nlwl-lexicon")//*:lexicon
let $count := count($nlwl/*:entry/*:partOfSpeech/*[name()=$pos])
order by $count descending
return nlwl:rows2(map:get($genera,$pos), $count)
}
let $zeropos := count(collection("nlwl-lexicon")//*:partOfSpeech[not(*)])
let $ambiguous := count(collection("nlwl-lexicon")//*:entry[*:partOfSpeech[*[2]]])
let $orthography := count(collection("nlwl-lexicon")//*:entry[*:forms/*:other])
let $entries := count(collection("nlwl-lexicon")//*:entry)
return element table {
  element thead {
  nlwl:rows2("Lemmata omnia", $entries),
  nlwl:rows2("Orthographice variantur", $orthography),
  nlwl:rows2("Sine genere verborum", $zeropos),
  nlwl:rows2("Pluribus generibus verborum annotata", $ambiguous)
},
    $poslist
}