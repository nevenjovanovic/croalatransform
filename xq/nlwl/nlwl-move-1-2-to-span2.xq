(: move indices of meaning to span 2 :)
for $span in //*[*:span[1][@*:style-name][matches(.,"LL\[\s+[12]")]]
let $span1a := substring-after($span/*:span[1], " ") || " " || data($span/*:span[2])
let $span2 := $span/*:span[2]
return replace node $span2 with
element span { $span1a }