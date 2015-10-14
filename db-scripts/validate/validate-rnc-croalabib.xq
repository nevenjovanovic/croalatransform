(: validate xml in croalabib db, use rnc / compact notation schema :)
for $i in db:open('croalabib')
return
validate:rng-info($i, 'croalabib.rnc', true())