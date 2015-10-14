(: return multi-word phrases and their translations :)
(: ghlh-got corpus of Greek/Croatian and Latin/Croatian :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

(: convert @nrefs values to sequences :)
declare function croala:refs-seq
  ( $c )  {
for $i in $c/@nrefs
return element refidx { attribute n {db:node-pre($i)} ,
for $a in tokenize($i, " ")
return element idx {  $a } 
}
 } ;
 let $fraze := element tbody {
 for $i in collection("ghlh-got")//*:wds[@lnum="L2"]//*:refs
 let $cc := croala:refs-seq($i)
 let $ccs := string-join($cc/*:idx, ' ')
 where count($cc/*:idx) > 4
 return element tr {
   element td { $ccs },
   element td { 
   for $ax in $i/ancestor::*:wds[@lnum="L2"]//*:refs[@nrefs=$ccs] return data($ax/../*:text)
 },
   element td { 
   for $ix in $cc/*:idx return data($i/ancestor::*:sentence/*:wds[@lnum='L1']/*:w[@n=$ix]/*:text) }
 }
}
let $trsing := $fraze/tr[index-of($fraze/tr/td[1], 
                      td[1]
                     )
                      [1]
            ]
for $trd in $trsing
return element tr { $trd/td[position() gt 1] }