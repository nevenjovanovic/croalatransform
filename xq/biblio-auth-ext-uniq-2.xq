element a { for $autori in tokenize(
let $ime := for $i in //*:biblStruct[@type="externum"]/*:monogr/*:author[not(*:ref)]//text()
order by $i
return element i { $i }
return string-join(distinct-values($ime), '%'), '%')
return element n { $autori } }