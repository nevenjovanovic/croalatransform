element pubs { for $p in 
for $a in distinct-values((//*:pubPlace[normalize-space() = text()] , //*:pubPlace/*:add[normalize-space() = text()]))
order by $a
return element n { replace($a, ' ', '+') }
return $p }