for $i in //*:persName
let $idx := $i/@ref
let $text := string-join($i//text()[not(ancestor::*:note[@place='foot'])])
group by $idx
order by $idx
return element tr { element td { $idx } , 
element td { distinct-values($text) } }