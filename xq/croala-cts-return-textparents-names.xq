(: for a specific file, return names of all elements containing text nodes :)
let $d := db:open("croala-epica", "benesa-d-dmc.xml")/*:TEI//*:text//*[text()]
return distinct-values($d/name())