(: count verses in periods :)
for $coll in ("latty", "croala")
let $doccount := count(collection($coll)/*)
for $period in distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:creation/*:date/@period)
let $i := collection($coll)/*[descendant::*:profileDesc[1]/*:creation/*:date/@period=$period]//*:text[not(descendant::*:text)]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
where count($i) > 0
order by $period
return element tr { 
attribute class { $coll } ,
element td { $period } ,
element td { count($i) }
 }
