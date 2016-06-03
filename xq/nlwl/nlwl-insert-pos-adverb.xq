(: find parts of speech -- nouns, verbs, etc. :)
(: part 4, for verbs :)
(: insert element verb into partOfSpeech :)
for $pos in ("adv.", "adv")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[.=$pos]
return insert node element adverb {} into $e/partOfSpeech