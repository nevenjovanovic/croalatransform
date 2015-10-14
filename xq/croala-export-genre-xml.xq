(: export files of particular genre as xml, to an existing directory :)
(: use doc names :)
for $doc in //*:TEI[descendant::*:term[text() contains text 'epica']]
return file:write("/home/neven/rad/epika/txts/" || db:path($doc) , $doc , map { "method": "xml" } )