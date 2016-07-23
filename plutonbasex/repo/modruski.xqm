(: XQuery module for Modruski :)
module namespace modruski = 'http://croala.ffzg.unizg.hr/modruski';
declare function modruski:substring-before-last
  ( $arg ,
    $delim ) {

   if (matches($arg, $delim))
   then replace($arg,
            concat('^(.*)', $delim,'.*'),
            '$1')
   else ''
 } ;
declare function modruski:substring-after-last
  ( $arg ,
    $delim ) {

   replace ($arg,concat('^.*',$delim),'')
 } ;
 declare function modruski:getpassage ($urn){
   let $cts := collection("modruskicitconfig")//*:online
   for $t in $urn
let $urn1 := modruski:substring-before-last($t, ":") || ":"
let $xpath := modruski:substring-after-last($t, ":")
let $xpathphr := "//*[@n='" || replace($xpath, "\.", "']/*[@n='") || "']"
let $xpathphr2 := modruski:substring-before-last($xpathphr, "/")
let $passage := xquery:eval($xpathphr2, map { '': db:open('modruskiriario', data($cts[@urn=$urn1]/@docname)) })
return element tr { 
element td { $t } , 
element td {
normalize-space(data($passage)) }
}
 };