(: return two words at the end of line :)
let $cl3 := element claus {
for $aa in 
for $e in collection("pdillclausulae")//*:l
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
ft:tokenize($e)[last() - 1] , ft:tokenize($e)[last()] }
else()
order by $aa
return $aa
}
return db:create("poetifvclau2", $cl3 , "poeticlausulae2.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })
