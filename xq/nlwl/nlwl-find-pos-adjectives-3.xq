(: find parts of speech -- nouns, verbs, etc. :)
(: part 2, for adjectives :)
(: insert element adjective into entry :)
for $pos in ("adj", "adi", "adi.", "adj.")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb)]]
let $genderspan := $e/*:p/*:span
where $genderspan[.=$pos]
return insert node element adjective {} into $e/partOfSpeech