(: list all words :)
let $a := ft:tokenize(string-join(data(collection("croalafvclau3")//c/text()), ' ')) 
for $b in distinct-values($a) 
order by $b 
return $b