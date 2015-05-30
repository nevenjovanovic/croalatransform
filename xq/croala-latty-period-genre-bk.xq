let $xml := element csv {
  let $generaper := element ab { for $p in //*:profileDesc
for $per in $p/*:creation/*:date/@period
let $pergenre := $p/*:textClass/*:keywords[@scheme='typus']/*:term
group by $per
return element td { attribute class { $per } , 
 $pergenre
} }
for $a in distinct-values($generaper//*:term)
for $b in $generaper/*:td
let $freq := count($b/*:term[. eq $a])
order by $b/@class
return element tr { 
element td { data($b/@class) } , 
element td { $a } , 
element td { $freq } }
}
return csv:serialize($xml)