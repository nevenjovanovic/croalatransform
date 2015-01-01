for $b in 
let $a := element t { for $i in (//*:bibl|//*:biblStruct)[*:note[contains(@target, 'gen.b2')]]
order by ($i|$i/*:monogr/*:imprint)/*:date/@period , ($i|$i/*:monogr/*:imprint)/*:date
return element a { $i/@xml:id , $i/*:date/@period }
}
return distinct-values($a//*:a/@xml:id)
return element n {$b}