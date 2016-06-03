(: find parts of speech -- nouns, verbs, etc. :)
(: part 3, for substantives/adjectives :)
(: insert elements Noun and Adjective into entry :)
for $pos in ("\ssubst")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(noun)]]
let $genderspan := $e/*:p/*:span[matches(.,$pos)]
where $genderspan
return replace node $e/partOfSpeech with element partOfSpeech {
  element adjective {},
  element noun {}
}