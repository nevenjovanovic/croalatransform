(: call a record, show everything :)
let $adr := "croala.antitur.533"
let $recordnode := xs:integer(replace($adr,'croala.antitur.',''))
let $record := db:open-id("croantiturcica",$recordnode)
return element div { 
attribute class { "row"},
for $red in $record/* return element p { $red }
 }