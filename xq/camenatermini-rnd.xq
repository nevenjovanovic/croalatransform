(:return random row from camenatermini :)
let $b := 
for $a in collection("camenatermini")/table/tr
return $a
let $rng := random:integer(116404)
return $b[$rng + 1]