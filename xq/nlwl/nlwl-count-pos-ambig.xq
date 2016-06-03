declare namespace nlwl = 'http://croala.ffzg.unizg.hr/nlwl';

declare function nlwl:rows2($td1 , $td2 ){

element tr { 
  element td { $td1 },
  element td { $td2 }
 }
};

(: count ambiguous parts of speech :)

let $e := collection("nlwl-lexicon")//*:entry[*:partOfSpeech[*[2]]]
return nlwl:rows2(
  "plura genera" , count($e))