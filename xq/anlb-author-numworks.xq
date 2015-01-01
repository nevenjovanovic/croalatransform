(: analytic neo-latin - return author names and counts :)
for $a in //rc/a
let $n := distinct-values($a)
group by $n
order by $n
return element n { 
element name { replace($n, 'AUTHORS? *', '') } , 
element num { count($a) } }