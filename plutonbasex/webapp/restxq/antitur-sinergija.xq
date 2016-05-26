(: antitur-sinergija - show authors writing in years :)
let $a := 1435 to 1601
return 
for $n in $a 
let $r := collection("croantiturcica")//*:record[matches(Godina, xs:string($n))]
return element tr { 
element td { $n },
if ($r) then element td { 
for $aut in $r/*:Autor return element p { substring-before($aut, ',')} } 
else element td { "-" }  }
