for $a in element p { 
for $i in //*:wds[@lnum='L2']/*:w/*:text order by $i/text() collation "?lang=hr"
 return $i 
} 
return element popis { 
for $l in distinct-values($a/*:text) 
return element tok {$l}
}