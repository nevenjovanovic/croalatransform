(: serialize result as plain text :)
declare variable $n := ("anonymus-helicon.xml","pruner-g-partu.xml");
for $i in //text[db='latty'][fn=$n]
return file:write("/home/neven/Downloads/latty.json",json:serialize($i, map { 'format': 'direct' }))
