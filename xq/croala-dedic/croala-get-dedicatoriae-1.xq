(: get div nodes identified as dedications :)
(: descriptions should be more uniform :)

for $typ in ("epistula-dedicatio","epistula-praefatio","poesis-epistula-dedicatio","prosa-dedicatio","prosa-epistula-dedicatio","prosa-epistula-dedicatoria","prosa-epistula-praefatio","prosa-epistula-prologus","prosa-paratextus-praefatio","prosa-praefatio","prosa-proemium","prosa-prologus","prosa-prologus-epistula","prosa-prooemium","prosimetrum-proemium")
for $text in //*:TEI[descendant::*:div[@type=$typ]]
for $dedicatio in $text//*:div[@type=$typ]
let $filename := replace(db:path($text),".xml","") || "-" || db:node-id($dedicatio)
let $path := "/home/neven/rad/croala-r/croala-dedicatoriae/" || $filename  || ".xml"
let $xml := element TEI { 
attribute xml:id { $filename } , $text//*:teiHeader , element text { 
element front { 
attribute xml:id {db:node-id($dedicatio) } , $dedicatio } , element gap {} } }
return file:write($path, $xml)