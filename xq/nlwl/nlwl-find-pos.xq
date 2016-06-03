(: find parts of speech -- nouns, verbs, etc. :)
(: part 1, for nouns :)
(: insert element gender with m f n into entry :)
for $pos in ("m", "f", "n", "m.", "f.", "n.")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[.=$pos]
return insert node element noun {
  element gender { replace($pos, "\.", "") }
} into $e/partOfSpeech