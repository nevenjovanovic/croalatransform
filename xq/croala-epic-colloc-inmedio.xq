for $i in //*:l[. contains text 'in omnes']
let $g := base-uri($i)
group by $g
order by count($i)
return element l { attribute name {substring($g, 8)}, count($i)}