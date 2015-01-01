declare namespace functx = "http://www.functx.com";
declare function functx:sort-as-numeric
  ( $seq as item()* )   {

   for $item in $seq
   order by number($item)
   return $item
 } ;
let $rnd := element a { for $i in (1 to 10) return element b { random:integer(160)}}
return
data(functx:sort-as-numeric($rnd/*))