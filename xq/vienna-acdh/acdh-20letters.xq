(: from the db croala0, extract first 20 document with letters, write them to an existing directory :)
for $c in 1 to 20
let $ep := collection("croala0")//*:TEI[descendant::*:textClass/*:keywords/*:term[matches(.,'prosa oratio - epist')]]
let $name := "/home/neven/rad/vienna/" || db:path($ep[$c])
return file:write($name, $ep[$c], map { "method": "xml"})