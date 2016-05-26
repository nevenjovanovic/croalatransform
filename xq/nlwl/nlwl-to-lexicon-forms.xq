(: separate main form and other forms for rdf :)
element lexicon {
  for $w in //*:word
let $h := $w/*:h
let $uri := $w/*:p[2]
return element entry { 
attribute uri {$uri},
for $form in $h/text() return
if (matches($form, "\)")) then let $main := substring-before($form, " (")
let $other := substring-after(replace($form, "\)", ""), " (")
return element forms { element mainform { 
normalize-space(replace($main, "\n", "")) } , 
for $t in tokenize($other, ",") return element other { normalize-space($t) }}
else element forms {
  element mainform { normalize-space($form) }
}
 }
}