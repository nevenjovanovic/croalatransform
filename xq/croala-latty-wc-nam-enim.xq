(: analyse percentage of individual words in divs :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 10000) div 100
};



for $i in //wds
where $i/v contains text { "nam" , "igitur" , "enim" , "at" , "autem" , "ergo", "vero" , "uero" } any and fn:number($i/vc) > 3
let $n := $i/vc
let $pc := croala:round2(fn:number($n), fn:number($i/ancestor::d/wc))
order by $i/ancestor::text/fn
return element {$i/v} { $i/ancestor::d/nodeid, 
$i/ancestor::text/db, 
$i/ancestor::text/fn, 
$i/ancestor::text/gen,
element br { data($n) } ,
element pc { $pc }
}