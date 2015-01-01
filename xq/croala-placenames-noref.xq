let $gg := element w { for $y in string-join(//*:placeName[not(@ref)]//text(), ' ')
order by $y
return for $g in tokenize($y, '\s')
order by $g
return element p { $g } }
let $ggi := distinct-values($gg/p)
return for $o in $ggi
return element n { $o }