let $csv := element csv {
for $a in collection("croala")//*:text[descendant::*:l]
let $b := db:path($a)
let $l := count($a//*:l)
order by $b , $l
return element doc { 
element name { $b },
element vers { $l }
}
}
return csv:serialize($csv, map { 'header': true() })