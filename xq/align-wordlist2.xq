(: return wordlist of L1 words with aligned L2 translation equivalents :)
declare default element namespace "http://alpheios.net/namespaces/aligned-text";
for $s in //*:sentence
for $i in $s/*:wds[@lnum="L1"]/*:w
let $nr := $i/@n
let $l2 := $s/*:wds[@lnum="L2"]/*:w[*:refs[@nrefs=$nr]]
return element w { $nr , $i/*:text , 
if ($l2) then element l2 { data($l2//*:text) }
else ()    
}
