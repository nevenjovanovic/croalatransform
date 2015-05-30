(: perseus-dump-latin-names - in hib_entities db XML, exported from MySQL and clipped, find only Latin names :)
for $i in //*:table[not(contains(*:column[3], 'Greek')) and matches(*:column[3]/text(), '^[A-Z]') and not(matches(*:column[4]/text(), '^[A-Z]$'))]
return element n { data($i/*:column[4]) }