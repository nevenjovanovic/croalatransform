(: validate xml in croalabib, use rng schema :)
for $i in db:open('croalabib')
return
validate:rng-info($i, 'croalabib.rng')