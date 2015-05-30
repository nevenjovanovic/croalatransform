declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:rijeci ($words) {
  for $vba in distinct-values($words)
    let $count := count($words[. = $vba])
    return element wds {
      element v { $vba } ,
      element vc { $count }
    }
};
declare function croala:is-multiel ($terms) {
  if (some $str in $terms satisfies ($str[2]) ) then concat(data($terms) , ' ')
else data($terms)
};

declare function croala:divovi ($i) {
   for $div in $i
  let $nodeid := db:node-pre($div)
  let $words := ft:tokenize($div)
  let $wc := count($words)
  return element d {
    attribute type {"text"},
    element nodeid {$nodeid},
    element wc {$wc} ,
    croala:rijeci($words)
  }
};

for $i in //*:text[not(descendant::*:text)]
let $iid := db:node-pre($i)
let $db := db:name($i)
let $name := db:path($i)
let $period := $i/ancestor::*:TEI//*:profileDesc/*:creation/*:date/@period
let $typus := for $terms in $i/ancestor::*:TEI//*:profileDesc/*:textClass/*:keywords[@scheme='typus']/*:term

return croala:is-multiel($terms)
let $genre := for $terms2 in $i/ancestor::*:TEI//*:profileDesc/*:textClass/*:keywords[@scheme='genre']/*:term
return croala:is-multiel($terms2)
let $count := count(ft:tokenize($i))
let $divcount := count($i//*:div[not(descendant::*:div)])
return file:write("/home/neven/rad/croala-r/croalalattywc/croalawc/" || $iid || $name , element text { 
element db { $db } ,
element fn { $name } , 
element txtid { $iid },
element perd { data($ period) },
element typ { $typus } ,
element gen { $genre } ,
element dc { $divcount } ,
element wc { $count } ,
element divs {
 croala:divovi($i)
}
 }
)