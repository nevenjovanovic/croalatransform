(: XQuery module for CroALa-Pelagios :)
module namespace cp = 'http://croala.ffzg.unizg.hr/croalapelagios';
(: pretty printing of text :)
declare function cp:prettyp($settext, $ctsadr, $word) {
  element tr {
    element td { $ctsadr },
    element td { $word },
    element td {
  replace(replace($settext, ' ([,).;])', '$1'), '([(]) ', '$1')
}
}
};
(: from a CTS URN retrieve text in s parent element :)
declare function cp:openurn ($address) {
let $ctsadr := substring-after($address, '/cts/')
let $w := db:open("cp-placename-idx")//*:w[@n=$ctsadr]
let $word := $w/text()
let $pre := data($w/@xml:id)
let $text := data(db:open-pre("cp", $pre)/parent::*:s)
let $settext := normalize-space($text)
return cp:prettyp($settext, $ctsadr, $word)
};