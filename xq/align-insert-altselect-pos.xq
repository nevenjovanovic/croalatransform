(: select the correct pos, insert into word node as selectalt attribute :)
(: user supplies the word node-id and @n of correct alt element :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare updating function croala:selectpos($nodenum, $selectnum) {
let $a := db:open-id("osman",$nodenum)
(: handle wrong alt numbers and wrong nodes :)
return if ($a/*:alt[@n=$selectnum]) then
 insert node (attribute { 'selectalt'} {$selectnum}) into $a
 else ()
};
croala:selectpos(19491,1)