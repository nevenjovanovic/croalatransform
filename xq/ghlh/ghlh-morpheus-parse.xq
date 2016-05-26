(: extract distinct forms from ghlh-rdf db :)
(: send them to Perseus Morpheus :)
(: write to an XML file :)

let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=grc&amp;word=REPLACE_WORD&amp;engine=morpheusgrc')
(: get distinct values :)
let $wordlist := for $ww in 
let $w := collection("ghlh-rdf")/*/*:Description/*:wordform[@xml:lang='grc']
return distinct-values($w)
order by $ww collation "?lang=el"
return $ww
(: get parses :)
let $parses :=
element list {
for $i in $wordlist
return let $q := (doc(replace($morph, 'REPLACE_WORD',$i)))
return element word { element w { $i } , $q//*:rest }
}
return 
file:write("/home/neven/rad/ghlh-grc-lemmata.xml",$parses)
