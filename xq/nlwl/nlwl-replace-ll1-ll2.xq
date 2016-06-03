(: remove LL[ 1 etc. :)
for $span in //*[*:span[1][@*:style-name][matches(.,"LL\[\s+[12]")]]
return replace node $span with
element span { "LL[" }