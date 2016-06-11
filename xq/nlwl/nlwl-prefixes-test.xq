for $prefixes in ("abs?", "a[dcfgpts]", 
"ambi?", "ant[ei]", "aequi", "bi", "circu[mn]", "cis",
"co[nlmr]?", "contra", "de", "dextro", "di[sfr]?")
let $string := "^" || $prefixes
for $w in collection("nlwl-lexicon")//*:entry
where $w/*:forms/*:mainform[matches(.,$string)]
return $w/forms/mainform