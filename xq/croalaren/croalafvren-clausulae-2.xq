(: return three words at the end of line :)
let $cl3 := element claus {
for $aa in 
for $e in collection("croalafvren")//*:l
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@* ,
 ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
else()
order by $aa
return $aa
}
return db:create("croalafvrenclau2", $cl3 , "croalarenclausulae2.xml", map { 'ftindex': true(), 'intparse': true() })
