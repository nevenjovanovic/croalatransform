(: Find poetry, return count and person IDs :)
let $w := for $i in //*:occupation[@code='tax.poesis.epica']
order by $i/parent::*:person/@xml:id
return 
element data { attribute id {$i/parent::*:person/@xml:id} ,  $i/parent::*:person/*:persName[1]/text() }
let $ci := count($w)
return element report { element n { $ci } , $w }