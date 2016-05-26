(: return list of surnames / names in filenames :)
let $titles := for $f in //*:TEI
let $p := db:path($f)
order by $p
return if (matches($p,"-[a-z]-")) then $p
else()
for $t in $titles
let $ime := replace($t, '(-[a-z])-.*','$1')
group by $ime
return $ime