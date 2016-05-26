(: write repeated clausulae, with number of repetitions, to a db -- for poetiditalia :)
(: order descending :)

let $body :=
element tbody { 
for $c in collection("poetifvclau3")//*:c
let $un := $c/text()
group by $un
where count($c) > 1
order by count($c) descending
return element tr { 
element td { $un } , element td {count($c)} }
}
return db:create("poetifvrep", $body , "poeticlausulae3rep.xml", map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })