for $entry in collection("ghlh-got")//*:w/*:text
where $entry[ends-with(.,'ʼ')]
let $r2 := replace($entry, "ʼ", "'")
return replace value of node $entry with $r2