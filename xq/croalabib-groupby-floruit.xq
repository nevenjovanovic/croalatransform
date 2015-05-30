let $xml := element table { for $i in collection("croalabib")//*:listPerson[@type='croala.auctores']/*:person
let $period := 
if ($i/*:floruit/@period) then $i/*:floruit/@period
else if ($i/*:floruit/*:date/@period) then $i/*:floruit/*:date/@period
else()
group by $period
order by $period
return element tr { element td { replace($period, 'http://semium.org/time/', '') } , element td { count($i) } } }
return csv:serialize($xml)