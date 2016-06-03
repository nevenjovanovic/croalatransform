(: find parts of speech -- nouns, verbs, etc. :)
(: part 4, for verbs :)
(: insert element verb into partOfSpeech :)
for $pos in ("-are", "-ere", "-ire", "-ari", "-eri", "-iri")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[contains(.,$pos)]
return insert node element verb {
  element conjugation { $pos }
} into $e/partOfSpeech