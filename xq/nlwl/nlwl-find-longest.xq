(: find longest words in NLWL, display as table :)
for $e in //entry/forms/(mainform|other)
let $word := replace($e, " [12]", "")
let $urn := $e/ancestor::entry/@urn
let $c := string-length($word)
where $c > 14
order by $c descending
return element tr {
  element td { element a {
    attribute href {data($urn)}, replace(data($urn), "http://", "")
  }},
  element td { $word },
  element td { $c }
}