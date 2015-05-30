declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:groupbyper ($coll) { for $i in collection($coll)//*:profileDesc/*:creation/*:date[@period]
let $per := $i/@period
group by $per
order by $per
return element tr { 
element td { data($per) } , 
element td { count($i) } }
 };
 declare function croala:groupbygen ($coll) { for $i in collection($coll)//*:profileDesc/*:textClass/*:keywords[@scheme='typus']
for $per in $i/*:term
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

(: join centuries table and text data :)
let $xml1 := element csv { croala:groupbygen("croala"
)}

return $xml1