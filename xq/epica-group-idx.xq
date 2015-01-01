for $i in (//*:biblStruct|//*:bibl)//*:note[contains(@target,'gen.b2')]
let $gen := $i/@target
group by $gen
order by $gen
return element t { $gen , ":", count($i) }