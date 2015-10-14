(: return some basic info on a db as csv :)
(: result - name,size,documents,timestamp
croalabib,29814 KB,22,2015-09-17T18:26:10.000Z :)
let $options := map { 'header': true() }
return
csv:serialize(element csv { element record { db:info("croalabib")//*:databaseproperties/*[not(name()=('nodes','binaries'))] }}, $options)