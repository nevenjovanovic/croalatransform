(: validate xml in croalabib, use rng schema :)
for $i in db:open('latty2')
return
validate:rng-info($i, 'latty-tei.rng')