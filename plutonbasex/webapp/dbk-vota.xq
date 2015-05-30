import module namespace rest = "http://exquery.org/ns/restxq";
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";

declare %rest:GET %rest:POST %rest:path("dbk-vota")
function page:dbk-vota() { element report
{
(: How is the voting recorded? :)
for $vote in collection("dbkref")//tei:measure[@type='vota']
let $d := $vote/ancestor::tei:div[@ana='dies']/@n
order by string($vote)
return element v { attribute n { $d } , string-join($vote//text(), ' ') }

}
};
return

