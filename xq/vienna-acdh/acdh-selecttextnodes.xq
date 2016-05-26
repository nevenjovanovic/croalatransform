(: return only certain text nodes under text :)
copy $c := db:open("acdhcroala", "lucius-i-epist.xml")//*:text
modify (
  for $t in $c//text()[not(ancestor::*:note)][not(parent::*:abbr)][not(parent::*:foreign)][not(parent::*:corr[parent::*:choice])][not(parent::*:orig[parent::*:choice])]
  for $tokens in ft:tokenize($t, map { 'case': 'sensitive' })
  return insert node <w>{$tokens}</w> into $t/parent::*
)
return $c

