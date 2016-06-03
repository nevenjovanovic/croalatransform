(: find parts of speech -- nouns, verbs, etc. :)
(: part 3, for substantives/adjectives :)
(: insert elements Noun and Adjective into entry :)
for $pos in ("subst\.")
for $e in collection("nlwl-lexicon")//*:entry
let $genderspan := $e/*:p/*:span
where $genderspan[matches(.,$pos)]
return replace node $e/partOfSpeech with element partOfSpeech {
  element adjective {},
  element noun {}
}