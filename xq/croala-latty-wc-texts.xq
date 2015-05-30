(: create xml files with numbers of words in texts :)
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

for $db in ("croala", "latty")
for $i in collection($db)//*:text[not(descendant::*:text)]
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
return file:write("/home/neven/ownCloud/rad/croala-r2/croalalattywc2/" || $iid || $name , element text { 
element db { $db } ,
element fn { $name } , 
element txtid { $iid },
element perd { data($ period) },
element typ { $typus } ,
element gen { $genre } ,
element dc { $divcount } ,
element wc { $count }
 }
)