declare namespace croala='http://croala.ffzg.unizg.hr';
(: a function to mark names in a text node :)
(: problem -- cannot mark several names in the same node in one update :)


(: open database with list of names :)
element verb { let $n := collection("ghlh-kazalo")
for $a in $n//*:tok/text()[matches(.,'^a.*')]
(: return index nodes of results in text database :)
let $wcount := collection("ghlh-got")//*:wds[@lnum="L2"]/*:w[descendant::text()[. contains text {$a}] and *:refs[contains(@nrefs, ' ')]]
return $wcount
}