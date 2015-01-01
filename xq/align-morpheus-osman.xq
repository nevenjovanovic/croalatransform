declare default element namespace "http://alpheios.net/namespaces/aligned-text";
let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=lat&amp;word=REPLACE_WORD&amp;engine=morpheuslat')
for $i in //*:sentence/*:wds[@lnum='L2']/*:w[2]
where $i/*:text[not(matches(text(),'\W'))]
let $q := (doc(replace($morph, 'REPLACE_WORD',data($i/*:text))))
let $loc := <loc>
<e>term</e>
<e>stemtype</e>
</loc>
return element w { $i/@n , element text { $q//*:infl/*[not(local-name() = $loc//*:e)] } }