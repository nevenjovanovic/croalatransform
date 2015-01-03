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
 for $i in croala:refs-seq(collection("ghlh-got")//*:wds[@lnum="L2"]//*:refs)
 where count($i/*:idx) > 4
 return $i
