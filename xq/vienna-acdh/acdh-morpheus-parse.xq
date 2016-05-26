(: extract distinct forms from acdhcroala db :)
(: send them to Perseus Morpheus :)
(: write to an XML file :)

let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=lat&amp;word=REPLACE_WORD&amp;engine=morpheuslat')
let $wordlist := element list {
for $i in distinct-values(collection("acdhcroala")//*:w)
let $q := (doc(replace($morph, 'REPLACE_WORD',$i)))
return element word { element w { $i } , $q//*:rest }
}
return 
file:write("/home/neven/rad/acdh-lemmata.xml",$wordlist)