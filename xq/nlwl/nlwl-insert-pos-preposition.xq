(: find parts of speech -- nouns, verbs, etc. :)
(: part 4, for verbs :)
(: insert element verb into partOfSpeech :)
for $pos in ("praepos.", "praepos")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[.=$pos]
return insert node element preposition {} into $e/partOfSpeech