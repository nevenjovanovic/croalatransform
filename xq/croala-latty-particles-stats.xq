(: calculate stats for particles, compare :)
let $w := ("nam", "autem", "nempe", "enim", "igitur", "ergo", "at", "scilicet", "videlicet", "quippe", "nimirum")
for $v in $w
let $cr := collection("croala")/*:TEI[descendant::*:creation/*:date[1][contains(@period,"17xx")]]//*:p
let $cl := count($cr[text() contains text {$v}]) div count($cr)
let $lat := collection("latty")[descendant::*:creation/*:date[1][contains(@period,"17xx")]]//*:p
let $ll := count($lat[text() contains text {$v}]) div count($lat)
return if ($cl ne 0) then element {$v} { $ll div $cl } else ()
