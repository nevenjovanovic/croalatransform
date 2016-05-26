(: return single words at the end of Ovid's lines :)
(: for Ovid :)
let $cl3 := element claus {
for $aa in 
for $e in collection("ovidfv")//*:l
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
$e/@target ,
ft:tokenize($e)[last()] }
else()
order by $aa
return $aa
}
return db:create("ovidfvclau1", $cl3 , "ovidclausulae1.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })
