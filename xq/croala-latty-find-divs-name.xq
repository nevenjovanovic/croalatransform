(: find divs in idx db by name, order by ttr size :)
for $i in //div[contains(name, "stephani")]
let $ttr :=  number($i/ttr)
group by $ttr
order by $ttr descending
return element ana { $ttr, count($i)}