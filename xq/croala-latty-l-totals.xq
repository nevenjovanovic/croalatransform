(: count verses in collections :)
for $coll in ("latty", "croala")
let $i := collection($coll)//*:l[not(ancestor-or-self::*[@xml:lang]) and not(descendant::*:l)]
return count($i)