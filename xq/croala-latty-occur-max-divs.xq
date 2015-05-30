(: show only max values for occurrences in each div :)
for $div in //*:div
let $max := max($div/*:w/*:n)
where $max > 1
return element max {
  $div/@nodeid,
  $div/*:w[*:n=$max]
}