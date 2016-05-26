for $c in ("pdillfvrep2", "croalafvrenrep2", "croalafvrep2")
let $table :=
for $i in collection($c)//tr[string-length(td[1]) >= 21]
return element tr { attribute class {$c},  $i/td[1] , $i/td[2] }
return element div {
  attribute class {"col-sm-4 table-responsive"},
element table { 
attribute class { "table-striped  table-hover table-centered" } , $table }
}