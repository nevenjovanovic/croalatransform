(: annotate...  :)
(: unfinished :)
let $endings := ("ax", "ns", "ex")
for $e in //entry
where $e/partOfSpeech[not(*)] and $e/forms/mainform[ends-with(.,"ex")]
return $e/forms/mainform