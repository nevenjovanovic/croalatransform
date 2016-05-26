declare namespace tei = 'http://www.tei-c.org/ns/1.0';
declare function local:copy-filter-attributes(
       $element as element(),
       $attribute-name as xs:string*) as element() {
    element {node-name($element)}
            {$element/@*[not(name()=$attribute-name)],
                for $child in $element/node()
                   return if ($child instance of element())
                      then local:copy-filter-attributes($child, $attribute-name)
                      else $child
            }
  };
declare function local:clean-namespaces($node as node()) {
    typeswitch ($node)
        case element() return
            if (namespace-uri($node) eq "http://www.tei-c.org/ns/1.0") then
                element { QName("http://www.tei-c.org/ns/1.0", local-name($node)) } {
                    $node/@*, for $child in $node/node() return local:clean-namespaces($child)
                }
            else
                $node
        default return
            $node
};
for $i in //*:teiHeader
order by $i/*:fileDesc/@xml:id
return element bibl { attribute xml:id { $i/*:fileDesc/@xml:id } ,
(: autora može biti više :)
  for $a in $i/*:fileDesc/*:titleStmt/*:author
  return $a ,
(: izdavača može biti više :)
  for $e in $i/*:fileDesc/*:titleStmt/*:editor
  return if ($e[*:persName[descendant-or-self::*/@xml:id]]) then local:copy-filter-attributes($e, 'xml:id')
  else $e,
(: naslov :)
local:clean-namespaces($i/tei:fileDesc/tei:titleStmt/tei:title[1]) ,
(: mjesto izdanja, uvijek isto :)
element pubPlace { 
  attribute ref {"3186886" } ,
  "Zagreb" } ,
element publisher { 
for $p in $i/*:fileDesc/*:publicationStmt/tei:p[1]/(*|text())
return $p } ,
(: datum digitalnog izdanja :)
if ($i/*:fileDesc/*:publicationStmt/*:p[1]/*:date[1]) then
element date { 
attribute when { replace($i/*:fileDesc/*:publicationStmt/*:p[1]/*:date[1], '[^0-9]' , '') } ,
attribute period { "20xx_1_third" },
replace(data($i/*:fileDesc/*:publicationStmt/*:p[1]/*:date[1]), '[^0-9]', '')
} 
else element date { "N/A" } ,
(: poveznica na datoteku na internetu :)
element relatedItem { attribute type { "internet" }, 
element ref { attribute type { "croala" } , attribute target { "#" || $i/*:fileDesc/@xml:id } , "CroALa: " || data($i/*:fileDesc/@xml:id) }
}
 }