(: tb non-projective head :)
let $interp := ("AuxX", "AuxK")
for $w in db:open("ogl-grtb","tlg0007.tlg004.perseus-grc1.tb.xml")/treebank//*:word[not(@relation=$interp)]
let $id := xs:integer($w/@id)
let $head := xs:integer($w/@head)
where $head < $id
let $sibling := $w/preceding-sibling::*:word[not(@relation=$interp) and @id < $id and @id > $head and @head < $head and @head != 0]
where ($sibling)
return element s { $id , $head , $sibling }