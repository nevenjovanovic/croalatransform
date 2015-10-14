element tbody { 
(: element tr {
  element td { "Form"}, element td {"Ref"}
} , :)
for $i in //*:placeName
let $text := string-join($i//text()[not(ancestor::*:note[@place='foot'])])
order by $i/name() , $i
return element tr { element td {replace($text, '[\n ]+', ' ') } , element td { 'croala.' ||  lower-case(replace($text, '[\n ]+', '-')) || '.01' } }
}