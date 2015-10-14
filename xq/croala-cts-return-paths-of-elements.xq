(: return paths from TEI to any element containing text in a document :)
let $paths :=
for $names in ("div", "head", "l", "note", "p", "closer")
let $d := db:open("croala-epica", "benesa-d-dmc.xml")/*:TEI//*:text//*[name()=$names]
return $d/string-join(ancestor-or-self::*/name(.), '/')
return distinct-values($paths)