let $b := //*:listBibl/(*:bibl|*:biblStruct)
let $a := //*:listPerson/*:person
let $ms := //*:msDesc
let $op := //*:listBibl[@ana='croala.opera']/*:bibl
let $rel := //*:relatedItem[*:ref/@target]
return element ul {
element li { "Auctores: ", count($a) },
element li { "Tituli: ", count($b) },
element li { "Opera: ", count($op) },
element li { "Libri: " }, 
element li { "Manuscripta: " , count($ms)},
element li { "Digitalia: " , count($rel)}
}