let $zwsp := '"'
for $w in //*:sentence/*:wds[@lnum='L1']/*:w
let $head := $w/ancestor::*:sentence/*:wds[@lnum='L2']
let $refs := data($w/*:refs/@nrefs)
for $r in tokenize($refs, ' ')
return $zwsp || data($head/*:w[@n=$r]) || $zwsp || " <http://croala.ffzg.unizg.hr/elements/isTranslationOf> " || $zwsp || data($w) || $zwsp || "."