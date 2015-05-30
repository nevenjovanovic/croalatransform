(: return clausulae from Latin l elements and information on them :)
let $claus :=
for $i in //*:TEI//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return element l {
  $i//text()[not(parent::*:note or parent::*:ref or parent::*:bibl or parent::*:num or parent::*:foreign or parent::*:mentioned or parent::*:p or parent::*:del or parent::*:sic[parent::*:choice])]
}
return
let $aa := for $e in $claus return replace(replace(
  ft:tokenize($e)[last()], '[\W\d]', ''),'[vV]','u')
return distinct-values($aa)