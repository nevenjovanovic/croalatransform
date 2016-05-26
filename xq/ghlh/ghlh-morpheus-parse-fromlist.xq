let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=grc&amp;word=REPLACE_WORD&amp;engine=morpheusgrc')
let $replace2 := ("ἀλλ'", "ἀνθ'", "ἀπ'", "ἆρ'", "δ'", "δι'", "Δί'", "ἐπ'", "κατ'", "μετ'", "παρ'", "ὑπ'")
for $replace in $replace2
let $parses := 
let $q := (doc(replace($morph, 'REPLACE_WORD',$replace)))
return element word { element w { $replace } , $q//*:rest }
return $parses
