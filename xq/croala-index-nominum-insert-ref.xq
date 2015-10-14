let $index := doc('/home/neven/ownCloud/documents/latinisti/materijal/de-nostratibus/tideo/tideo-index-nominum.xml')
for $t in $index//td[1]
for $i in //*:persName[ft:contains(.,$t)]
return 
insert node attribute {'ref'} {$t/following-sibling::*:td} into $i