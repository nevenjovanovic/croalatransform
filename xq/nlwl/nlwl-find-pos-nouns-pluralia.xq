(: find parts of speech -- nouns, verbs, etc. :)
(: part 3, for substantives/adjectives :)
(: insert elements Noun and Adjective into entry :)
for $pos in ("n. pl", "m. pl", "f. pl")
for $e in collection("nlwl-lexicon")//*:entry[partOfSpeech[not(adjective|noun|verb|adverb|particle)]]
let $genderspan := $e/*:p/*:span
where $genderspan[contains(normalize-space(.),$pos)]
return insert node 
  element noun {
    element plural {},
    element gender { replace($pos, "[^mfn]", "")}
  }
into $e/partOfSpeech