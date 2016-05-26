for $w in //*:word[not(*:rest[2]) and descendant::*:entry[not(*:infl[2])]]
order by lower-case($w//*:hdwd)
return element w {
  attribute lemma { data($w//*:hdwd) },
  attribute lemmaRef { data($w//*:entry/@uri) },
  data($w/*:w)
}