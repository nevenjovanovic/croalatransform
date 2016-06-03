(: find parts of speech -- nouns, verbs, etc. :)
(: part 2, for adjectives :)
(: insert element adjective into entry :)
for $pos in ("part", "part.")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[.=$pos]
return insert node element particle {} into $e/partOfSpeech