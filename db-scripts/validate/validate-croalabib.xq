(: validate files in croalabib db :)
(: the dtd is in the same directory :)
for $i in db:open('croalabib')
return
validate:dtd-info($i, 'croalabib.dtd')