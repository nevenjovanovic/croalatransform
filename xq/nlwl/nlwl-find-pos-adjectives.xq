(: find parts of speech -- nouns, verbs, etc. :)
(: part 2, for adjectives :)
(: insert element adjective into entry :)
for $pos in ("-a, -um", "-tra", "-ra,", "-e\s", "-era", "-ntis", "-e\]", "-cris,")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[matches(.,$pos)]
return insert node element adjective {} into $e/partOfSpeech