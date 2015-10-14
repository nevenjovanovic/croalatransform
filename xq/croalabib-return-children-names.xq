(: for a specific file, return names of all elements which are children of given element :)
let $d := db:open("croalabib", "manifestacije/tisak/drame.xml")/*:TEI//*:text//*[text()]
let $distinct := distinct-values($d/name())
return element div { 
element p { count($distinct) },
element ul { 
for $i in $distinct
order by $i
let $occur := $d[name()=$i]
let $parent := $occur/../name()
let $child := $occur/*/name()
return element li {"Elementum:" , 
  element code { $i }, " occ. " || count($occur) , element br {} ,
  element small { "Parentes:" , distinct-values($parent) },
  element br {} ,
  element small { "Liberi:", if ($child[1]) then distinct-values($child) else "N/A" } }
}
}