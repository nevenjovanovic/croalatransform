let $report := 
element csv {
for $i in //*:listBibl[@ana="croala.sekundarna.akad.izd"]/*:biblStruct
let $date := $i//*:imprint/*:date
group by $date
order by $date
return element tr { 
element td { $date } , element td { count($i)}
}
}
let $options := map { 'lax': false() }
return csv:serialize($report, $options)