(: return single words at the end of line, Vitezović :)
let $cl3 := element claus {
for $aa in 
for $e in collection("vitezovicfv")//*:l
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@* ,
 ft:tokenize($e)[last()] }
else()
order by $aa
return $aa
}
return db:create("vitezovicfvclau1", $cl3 , "vitezovicclausulae1.xml", map { 'ftindex': true(), 'intparse': true() })
