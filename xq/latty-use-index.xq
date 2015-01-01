for $i in tokenize(collection("latty-idx")/*:nomina/*:entry/*:lemma[. contains text "benedictinorum"]/following-sibling::*:idx/text(), '\s')
return element p { db:open-pre("latty",xs:integer($i)) }