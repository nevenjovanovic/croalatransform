let $csv := element r { for $i in //d
let $perd := tokenize($i/ancestor::text/perd, ' ')[1]
let $hapax := count(
for $b in $i/wds
where $b/vc = 1
return $b )
let $rr := ( "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero", "et", "ac", "atque")
let $rijeci := for $r in $rr 
return element {$r} { if ($i/wds[v=$r]) then round(fn:number($i/wds[v=$r]/vc) div $i/wc * 100) div 100 else 0 }
return element csv {
  element name { data($i/ancestor::text/db) || data($i/ancestor::text/fn) } ,
  element td { fn:number(replace($perd, '[^0-9]', '')) div 10 } ,
  $i/nodeid,
  element td { round(fn:number($i/wc) div fn:number($i/ancestor::text/wc) * 100) div 100 } ,
  element td { if ($i/wds) then round(count($i/wds) div $i/wc * 100) div 100 else 0 } ,
  element td { if ($hapax > 0) then round($hapax div $i/wc * 100) div 100 else 0 },
  $rijeci
}
}
return csv:serialize($csv)