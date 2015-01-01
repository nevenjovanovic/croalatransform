for $a in collection("imena")//*:name/text()
for $wcount in db:node-pre(collection("latty")//*:text//text()[. contains text {$a}])
where $wcount != 0
return db:open-pre("latty", $wcount)/..