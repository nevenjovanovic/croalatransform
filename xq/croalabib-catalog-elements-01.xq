(: list all documents in a collection, with link to a list of all their element names :)
let $db := 'croalabib'
return 
element div {
element h1 { $db } ,
element ul {
for $d in collection($db)//*:TEI//*:text
let $path := db:path($d)
return element li { 
element a {
  attribute href { '/croala-ana/' || $db || '&amp;' || replace($path, '/', '&amp;') } ,
  $path }
}
}
}