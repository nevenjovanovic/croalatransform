(: read in a csv Bible, convert to xml :)
let $text := file:read-text('/home/neven/Downloads/biblija/lxx/lxx.csv')
return csv:parse($text, { 'header': true(), 'separator': '	' })