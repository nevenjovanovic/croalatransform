for $c in 1 to 100
let $q := collection("croalafvrep")//*:tr[$c]
return ft:search("poetifvrep", $q/td[1])