declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

(: count number of orthographical variations :)
for $i in collection("nlwl-lexicon")//*:entry
let $c := count($i/*:forms/*)
where $c > 1
group by $c
order by $c descending
return
nlwl:rows2($c, $i/*:forms/*:mainform)
