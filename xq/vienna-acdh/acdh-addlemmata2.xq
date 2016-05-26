(: add @lemma and @lemmaRef for ambiguously identified :)
(: use the unambiguously identified to guess :)
let $lemmata := doc("/home/neven/rad/acdh-lemmataidentified2.xml")
for $l in $lemmata//*:w
for $w in collection("acdhcroala")//*:w
where $w[.=data($l)]
return replace node $w with element w { $l/@lemma , $l/@lemmaRef , data($w) }