(: find overlap between two sets :)
for $i in //table[tr[2]/td[2]/a[. eq 'stay-b-phil-rec.xml']]
where $i[tr[2]/td[2]/a[. eq 'stay-b-philos.xml']]
return $i/tr[1]