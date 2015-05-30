declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:groupbyper ($coll) { for $i in collection($coll)//*:profileDesc/*:creation/*:date[@period]
let $per := $i/@period
group by $per
order by $per
return element tr { 
element td { data($per) } , 
element td { count($i) } }
 };
declare function croala:saecula () { 
element t { 
(: recur to make centuries and their thirds :)
for $x in 9 to 19
for $y in 1 to 3
return element td { fn:format-number($x, "00") || "xx_" || $y || "_third" }
}
};
declare function croala:join ($saecula,$xml) {
  element tbody { for $a in $saecula/td
return if ($a[text()=$xml/tr/td[1]/text()]) then $xml/tr[td[1][text()=$a/text()]]
else element tr { $a , element td { "0" }}
}
};
let $saecula := croala:saecula()
(: get data from a text collection :)
let $xml := element csv { 
croala:groupbyper("latty")
}
(: join centuries table and text data :)
let $rez := croala:join($saecula,$xml)
let $xml1 := element csv { croala:groupbyper("croala"
)}
let $rez1 := croala:join($saecula,$xml1)
for $j in $rez/tr[td[1]=$rez1/tr/td[1]]
return element tr { $j/td[1] , $rez1/tr[td[1]=$j/td[1]]/td[2] , $j/td[2] }