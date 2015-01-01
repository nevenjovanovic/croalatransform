(: list all element names in a collection in alphabetical order :)
for $a in distinct-values(/*/descendant-or-self::*/name(.)) 
order by $a 
return $a