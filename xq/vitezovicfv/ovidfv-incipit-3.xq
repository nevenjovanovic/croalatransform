(: return three words at the end of Ovid's lines :)
(: group by repetitions, most of them first :)
(: for Ovid, creates 10458 rows :)
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../plutonbasex/repo/vitezovic.xqm";
declare variable $maincollection := "ovid-pdl2";
declare variable $collection := "ovidfv2";
declare variable $dbname := "ovidfv2inc3";
declare variable $dbdocname := "ovidincipit3.xml";
let $cl3 := element claus {
for $aa in 
for $e in collection($collection)//*:v
return if (matches($e//text(), '[a-z]')) then element c { 
$e/@vid ,
$e/@target ,
for $n in 1 to 3
return ft:tokenize($e)[$n] }
else()
order by $aa
return $aa
}
let $tbody := element tbody {
for $clausula in $cl3//c
let $text := $clausula/text()
group by $text
order by $text
return element tr {
element td { $text } ,
element td { 
  for $id in $clausula/@vid 
  let $nodeid := data($id)
  return element a { vit:localnode($maincollection,$nodeid) , $nodeid } }
}
}
return db:create($dbname, $tbody , $dbdocname, map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })