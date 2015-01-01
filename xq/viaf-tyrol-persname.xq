declare namespace TEI="http://www.tei-c.org/ns/1.0";
for $i in //*:persName[1]
where $i[text()]
order by $i
return element n { data($i) }