(: poeti-create: create clausulae db for Poeti d'Italia :)
(: add information on source files and periods :)

for $l in collection("pdill0")//*:l
let $node := element v { 
attribute vid {db:node-pre($l)} , 
attribute target {db:path($l)},
$l/ancestor::*:TEI//*:titleStmt/*:author/*:date/@period ,
$l }
return file:append("/home/neven/rad/croala-r/pdill01clausulae.xml" , $node )