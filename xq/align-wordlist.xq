(: return wordlist of Greek words with aligned translation equivalents :)
declare default element namespace "http://alpheios.net/namespaces/aligned-text";
for $i in //*:wds[@lnum="L1"]/*:w
let $nr := $i/@n
let $l2 := $i/ancestor::*:aligned-text//*:wds[@lnum="L2"]/*:w/*:refs[some $s in tokenize(@nrefs, ' ') satisfies ($s = $nr )]
order by $i/*:text collation "?lang=el" 
return element w { $i/*:text  , $l2/preceding-sibling::*:text }