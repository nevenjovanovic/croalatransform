(: How many verses in Riter Vitezović's letters? :)
let $textcounts := element table { for $text in collection("vitezovic-epistolae2")//*:TEI
let $title := $text/*:teiHeader/*:fileDesc/*:titleStmt/*:title
let $versecount := count($text//*:text//*:l)
return element tr {
  element td { data($title)},
  element td { $versecount }
} }
let $totalcount := sum(data($textcounts//tr/td[2]))
return element tbody { $textcounts//tr ,
element tr { 
element td { "Omnes versus" },
element td { $totalcount } }
}