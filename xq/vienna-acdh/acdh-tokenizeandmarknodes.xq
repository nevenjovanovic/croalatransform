(: tokenize certain text nodes under text :)
(: mark tokens with w element :)

  for $t in collection("acdhcroala")//*:text//text()[not(ancestor::*:note)][not(parent::*:abbr)][not(parent::*:foreign)][not(parent::*:corr[parent::*:choice])][not(parent::*:orig[parent::*:choice])]
  for $tokens in ft:tokenize($t, map { 'case': 'sensitive' })
  return insert node <w>{$tokens}</w> into $t/parent::*

