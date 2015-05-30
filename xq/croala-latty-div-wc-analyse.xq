declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 100) div 100
};

for $idx in 
for $i in //*:text[not(ancestor::*:text)]
let $dc := count($i//*:div)
let $wc := count(ft:tokenize($i))
order by $dc descending
return element tr { 
element td { base-uri($i) } , 
element td { $dc } ,
element td { $wc } ,
element td { croala:round2($wc,$dc) }
}
let $ratio := number($idx//td[4])
let $class := if ($ratio < 10) then "1 SUB 10"
else if (10 <= $ratio and $ratio < 100 ) then "2 SUB 100"
else if (100 <= $ratio and $ratio < 500 ) then "3 SUB 500"
else if (500 <= $ratio and $ratio < 1000 ) then "4 SUB 1000"
else if (1000 <= $ratio and $ratio < 3000 ) then "5 SUB 3000"
else if (3000 <= $ratio and $ratio < 5000 ) then "6 SUB 5000"
else if (5000 < $ratio ) then "7 SUPER 5000"
else "na"
group by $class
order by $class
return element tr { $class , count($idx)}