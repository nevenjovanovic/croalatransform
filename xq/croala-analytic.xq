declare default element namespace "http://www.tei-c.org/ns/1.0";
let $i := //*:TEI[*:teiHeader/*:fileDesc[@xml:id="silobod-bolsic-m-fundamentum"]]
for $y in $i//*:text//*:div
return element analytic { element title { string-join($y/*:head//text() | $y/*:opener//text(), ' ') } , element title { attribute type {'incipit'}, data($y/*:l[1]/text()) , substring(string-join($y//*:p[1]//text(), ' '), 0, 100) } }