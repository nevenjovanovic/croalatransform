(: find parts of speech -- nouns, verbs, etc. :)
(: part 2, for adjectives :)
(: insert element adjective into entry :)
for $pos in ("-e\s")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(*)]]
let $genderspan := $e/*:p/*:span[matches(.,$pos)]
return insert node element adjective {} into $e/partOfSpeech