for $i in //*:q
let $nl := "&#10;"
return if ($i[ends-with(text()[1], ',')])
then concat(substring-before($i/text()[1], ','), $nl)
else (concat($i/text()[1], $nl))
