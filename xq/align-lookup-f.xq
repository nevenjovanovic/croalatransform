declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:lookup($input) {
  element table { 
element thead {
    element tr {
      element th {"Hrv"},
      element th {"Lat"}
    }
  } ,
element tbody {  for $i in collection("osman")//*:sentence
for $a in $i//*:w[*:text contains text {$input} using wildcards]
let $r := tokenize($a/*:refs/@nrefs, ' ')
let $h := $i/*:wds[@lnum='L2']/*:w[@n=$r]
return 


element tr { attribute nrefs {$r} , 
element td { attribute id {db:node-id($a)} , data($a) }, 
element td { attribute id {db:node-id($h)} , data($h) } }
}
}
};
let $w := croala:lookup(('pomo.+', 'sreć.','nesre.e','sinje', 'izdaj.+'))
return $w