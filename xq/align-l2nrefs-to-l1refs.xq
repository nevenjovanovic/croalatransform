(: use L2 nrefs to get to L1 refs :)
for $i in //*:sentence
for $a in $i/*:wds[@lnum='L2']/*:w[*:word[starts-with(@postag, 'v')]]
(: get L1 refs :)
let $nrefs := tokenize($a/*:refs/@nrefs, ' ')
let $refs := $i/*:wds[@lnum='L1']/*:w
return element trl { attribute s { db:node-id($i) } ,  string-join(data($refs[@n=$nrefs]/*:text), ' ') , ":" , string-join($a/*:text, ' ') }