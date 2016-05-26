declare namespace align = "http://alpheios.net/namespaces/aligned-text";
for $s in //*:aligned-text/*:sentence/*:wds[1]
let $c := $s/*:comment
order by $c
return element s { attribute uri { data($c) } ,
for $t in $s//align:text return element a { 
attribute href {
  $t/following-sibling::align:refs/@nrefs
} , $t } }