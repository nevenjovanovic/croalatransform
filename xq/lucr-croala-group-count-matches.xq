(: group by count of matches :)
for $i in //tr[2]/td[1][not(.='0')]
let $g := data($i)
group by $g
order by xs:integer($g) descending
return element g { $g || ": " || count($i) }