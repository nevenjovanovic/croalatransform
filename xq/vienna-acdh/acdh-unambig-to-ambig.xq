(: extract lemmata of forms with ambiguous parses :)
(: but with other unambiguous parses in the corpus :)
for $ambunamb in element set {
let $unamb := data(//*:word[*:rest[1] and not(*:rest[2])]/*:rest[*:entry/@uri]/*:entry/@uri)
for $amb in //*:word[*:rest[2]]
where $amb/*:rest/*:entry[@uri=$unamb]
return element lemma { 
for $u in $amb/*:rest/*:entry[@uri=$unamb]/@uri 
return element lm {$u} , $amb/*:w }
}
(: from the set return only those with single lemmata :)
return for $u in $ambunamb/*:lemma[not(*:lm[2])] 
return element w {
  attribute lemma { data(doc($u/*:lm/@uri)//*:citeProperty[@name='normalizedlemma']) },
attribute lemmaref {data($u/*:lm/@uri)},
data($u/*:w)
}

