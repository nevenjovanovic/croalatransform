element lexicon {
  for $h in //*:h
  let $urn := replace(
    replace(
    replace($h/following-sibling::*:p[2], "NO\[", "www.neulatein.de/words/"), ":", "/"),
    "\] *", ".htm"
  )
return element entry {
  attribute urn { 
  "http://" || $urn
   } ,
  for $form in $h/text() return
if (matches($form, "\)")) then let $main := substring-before($form, " (")
let $other := substring-after(replace($form, "\)", ""), " (")
return element forms { element mainform { 
normalize-space(replace($main, "\n", "")) } , 
for $t in tokenize($other, ",") return element other { normalize-space($t) }}
else element forms {
  element mainform { normalize-space($form) }
} , $h/following-sibling::*:p[1]
}
}