(: return word count for each file :)
(: provide wordcount element with @title and @wc :)
(: save as files in wordcount directory :)
let $wcs := element wordcounts {
let $collection := "croala0"
for $w in collection($collection)//*:text
let $toks := for $t in ft:tokenize($w) return count($t)
order by db:path($w)
return element text { attribute title {
  db:path($w)} , attribute id { db:node-id($w)
} , attribute wc { sum($toks) } }
}
return file:write("/home/neven/rad/croala-r/basex/croala-wordcounts.xml", $wcs)