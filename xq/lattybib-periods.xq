declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:authstats($collection) {
for $i in collection($collection)//*:listPerson[ends-with(@type, 'auctores')]/*:person
let $period := substring($i/*:floruit[1]/@period, 1, 4)
group by $period
order by $period
return element tr {
  element td { if ($period) then $period else "NN" },
  element td { count( $i )}
}
};
for $bibs in ("tei-tyrolis", "croalabib")
let $c := croala:authstats($bibs)
return 
element div {
  attribute class { "table-responsive col-md-6"} ,
element table { 
attribute class { "table table-striped"},
element thead {
  element tr {
    element td { "Period" },
    element td { "Quot"}
  }
},
element tbody { attribute type {$bibs} , $c }
}
}