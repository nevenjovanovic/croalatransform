element wlist {
for $w in //*:word[*:rest[1] and not(*:rest[2])]
order by lower-case($w//*:hdwd)
return element w {
  attribute lemma { data($w//*:hdwd) },
  attribute lemmaRef { data($w//*:entry/@uri) },
  data($w/*:w)
}
}