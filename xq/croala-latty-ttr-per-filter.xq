(: filter index database on period and ttr :)
let $csv := element csv { for $i in //div[contains(per,'16')]
let $ttr := round(number($i/ttr) * 10) div 10
where $ttr lt 0.7 and $ttr gt 0.4
group by $ttr
order by $ttr descending
return element tr { element c { $ttr } , element n {count($i)} , 
element wc { distinct-values($i/tok)},
element dc { count(distinct-values($i/name )) } ,  
element dcn { distinct-values($i/name ) }  }
}
return $csv