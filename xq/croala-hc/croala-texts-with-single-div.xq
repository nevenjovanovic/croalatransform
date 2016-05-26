(: return paths for texts with single divs :)
(: without front or back elements :)

for $f in /*:TEI[not(descendant::*:text[2]) and not(descendant::*:div[2])]//*:text/*:body[not(preceding-sibling::*:front) and not(following-sibling::*:back)]/*:div[1][not(*:div)]
let $p := db:path($f)
order by $p
return "/home/neven/rad/croala-r/txts/" || $p