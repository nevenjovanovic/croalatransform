declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

(: count all entries :)

let $e := collection("nlwl-lexicon")//*:entry
return nlwl:rows2(
  "Lemmata omnia" , count($e))