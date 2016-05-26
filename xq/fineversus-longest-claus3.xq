for $c in ("pdillfvrep", "croalafvrenrep3", "croalafvrep")
let $table :=
for $i in collection($c)//tr[string-length(td[1]) >= 28]
return element tr { attribute class {$c},  $i/td[1] , $i/td[2] }
return element div {
  attribute class {"col-sm-4 table-responsive"},
element table { 
attribute class { "table-striped  table-hover table-centered" } , $table }
}