(: for a specific file, return names of all elements which are children of last div :)
let $d := db:open("croala-epica", "benesa-d-dmc.xml")/*:TEI//*:text//*:div[parent::*:div]/*[text()]
return distinct-values($d/name())