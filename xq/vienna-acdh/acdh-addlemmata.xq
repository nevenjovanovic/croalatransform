let $lemmata := doc("/home/neven/rad/acdh-lemmataidentified.xml")
for $l in $lemmata//*:w
for $w in //*:w
where $w[.=data($l)]
return replace node $w with element w { $l/@lemma , $l/@lemmaRef , data($w) }