(: count types in divs, get average :)
let $a := for $i in //*:div
let $c := count($i/*:w)
order by $c
return $c
return avg($a)