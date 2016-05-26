for $c in ("croalafvrep2", "croalafvrenrep2", "pdillfvrep2")
let $table :=
for $i in 1 to 10
let $a := collection($c)//tr[$i]
return element tr { attribute class {$c},  $a/td[1] , $a/td[2] }
return element div {
  attribute class {"col-sm-4 table-responsive"},
element table { 
attribute class { "table-striped  table-hover table-centered" } , $table }
}