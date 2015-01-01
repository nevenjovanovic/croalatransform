db:create("latty-idx" , element nomina { for $a in collection("imena")//*:name/text()
let $b := db:node-pre(//*:text//text()[. contains text {$a}])
return element entry { element lemma { $a } , element idx { $b } }
} , "latty-idx.xml")