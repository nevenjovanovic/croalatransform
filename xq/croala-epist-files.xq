(: return names of files with 'epist' in 'croala' :)
(: there are files with letters named differently! :)
element table {
let $tbl :=
element a {
for $doc in collection('croala')
let $serv := "http://localhost:8984/rest/croala/"
    where contains(document-uri($doc), 'epist') or $doc//*:term[contains(text(), 'epist')]
    order by document-uri($doc)
return
element td { 
element a { 
attribute href {concat($serv, substring(document-uri($doc), 8))} , 
substring(document-uri($doc), 8) }
} 
}
return for $td at $broj in $tbl//td
return element tr { 
element td { $broj } , $td }
}