(: find composite rs elements, combine them :)
(: order by rs typology place, person, thing = @type :)
(: return as td with class from rs typology place, person, thing :)
for $i in //*:rs[@next] 
let $type := $i/@type
let $next := $i/@next 
let $nextel := //*:rs[@xml:id=replace($next, '#', '')]
order by $type , $i 
return element td { attribute class {$type} , data($i) , data($nextel) }