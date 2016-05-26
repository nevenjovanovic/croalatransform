(: return three words at the beginning of line :)
(: for Vitezović :)
let $cl3 := element claus {
for $aa in 
for $e in collection("vitezovicfv")//*:l
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
for $n in 1 to 3
return ft:tokenize($e)[$n] }
else()
order by $aa
return $aa
}
return db:create("vitezovicfvinc3", $cl3 , "vitezovicincipit3.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })
