let $set := element rdgs {
let $readings := collection("croala0")//*:text//(*:p|*:div[*:l])
for $p in $readings
order by db:node-id($p)
return element item { 
attribute target {db:path($p) } , 
attribute node { db:node-id($p) } , 
$p }
}
return db:create("croala-lectio", $set, "croala-lectiones.xml")