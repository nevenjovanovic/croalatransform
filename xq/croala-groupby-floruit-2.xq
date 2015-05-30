(: group by period, count authors in text collection :)
let $xml := element csv { for $i in //*:teiHeader
let $p := $i//*:profileDesc[1]/*:creation[1]/*:date[1]/@period
group by $p
order by $p
return element record { element p { $p } , element a { count(distinct-values($i//*:titleStmt/*:author)) }}
}
return csv:serialize($xml)