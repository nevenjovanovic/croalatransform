declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

(: count unambiguous parts of speech :)

for $e in collection("nlwl-lexicon")//*:entry[*:partOfSpeech[not(*[2])]]
let $pos := $e/*:partOfSpeech/*/name()
group by $pos
order by count($e) descending
return nlwl:rows2(
  if ($pos) then $pos else "sine nota" , count($e))