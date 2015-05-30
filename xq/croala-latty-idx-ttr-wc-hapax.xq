(: in an index file, count hapax, total, types, calculate ratios :)
let $i := doc("/home/neven/rad/croala-r/croalawcxsl/krcelic-b-ann.xml")
let $f := $i//@frequency
let $hapax := sum(for $a in $f
where fn:number($a) = 1
return $a)
let $wc := sum(for $b in $f return $b)
let $total := count($f)
return element n { 
element hap { $hapax } , 
element tot { $total }, 
element wc { $wc },
element ttr { round($total div $wc * 100) div 100 } ,
element hapttr { round($hapax div $wc * 100) div 100 } }