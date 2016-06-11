(: annotate nouns ending in -trix :)
for $e in //entry
where $e/partOfSpeech[not(*)] and $e//mainform[ends-with(.,"trix")]
return insert node element noun {
  element gender {"f"}
} into $e/partOfSpeech