let $collection := "croala0"
let $wcounts := for $w in collection($collection)//*:text
let $toks := ft:tokenize(data($w))
return count($toks)
return sum($wcounts)
