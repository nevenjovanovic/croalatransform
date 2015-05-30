(: count verses in periods :)
let $genper := element genper { 
for $coll in ("latty" , "croala")
let $period := distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:creation/*:date/@period)
for $a in $period
let $genre := distinct-values(collection($coll)/descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term)
for $b in $genre

return element tr { 
attribute class { $coll } ,
element td { attribute class { "genre" } , $b } ,
element td { attribute class { "period" }, $a },
element td { attribute class { "l" } , count(
  for $i in collection($coll)/*[descendant::*:profileDesc[1]/*:creation/*:date/@period=$a and descendant::*:profileDesc[1]/*:textClass/*:keywords[@scheme="genre"]/*:term[.=$b]]//*:text[not(descendant::*:text)]//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return $i )
}
 }
}
for $g in $genper/tr
where $g/td[@class="l"] > 0
order by $g/td[@class="period"]
return $g