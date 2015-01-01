let $b := 
for $url in //table/tr/td[3]/a/@href
let $a := element a { data($url) }
return $a
return file:write-text("/home/neven/rad/2014-12-31-camterm-idx.txt",string-join($b, "&#10;"))