(: return count of L1 words compared to count of L2 words :)
declare namespace aligned-text="http://alpheios.net/namespaces/aligned-text";
let $a := 
element p { 
for $s in //*:sentence
let $c1 := count($s/*:wds[@lnum='L1']/*:w)
let $c2 := count($s/*:wds[@lnum='L2']/*:w)
order by $c1 - $c2 descending
return element q { 
element c { db:node-id($s) } , 
element c { $c1 } ,
element c { $c2 } , 
element c { $c1 - $c2 } , 
element c { round($c2 div $c1 * 100) div 100 } }
}
(: return csv for R :)
return csv:serialize($a)
