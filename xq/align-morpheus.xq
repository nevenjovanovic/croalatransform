declare default element namespace "http://alpheios.net/namespaces/aligned-text";
let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=grc&amp;word=REPLACE_WORD&amp;engine=morpheusgrc')
for $i in //*:sentence/*:wds[@lnum='L1']/*:w[1]
let $q := (doc(replace($morph, 'REPLACE_WORD',data($i/*:text))))
return element w { $i/@n , element text { $q//*:infl } }