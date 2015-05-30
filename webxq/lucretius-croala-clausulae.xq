(: search in croala for Lucretius' clausulae :)
let $claus := <ls count="7407">
  <c id="2341">quaedam decedere abire</c>
  <c id="7017">ire et abire</c>
  <c id="1605">incolumis natura abituque</c>
  <c id="8254">linguam vocemque aboriri</c>
  <c id="15639">revocatum cedit abortu</c>
  <c id="12283">quam procul absit</c>
  <c id="12299">quam procul absit</c>
  <c id="17788">quo longius absunt</c>
  <c id="15487">subat ardet abundans</c>
  <c id="18557">molli lanugine abundans</c>
</ls>
for $c in $claus/c
let $s := concat(ft:tokenize($c)[last() - 1] , " ", ft:tokenize($c)[last()])
let $cro1 := collection("croala")//*:l[text() contains text {$s}]
let $cro2 := collection("croala")//*:l[text() contains text {$s} using fuzzy]
return element cl { $c || ": " || count($cro1) || ", " || count($cro2) }