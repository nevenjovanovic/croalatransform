(: use db with word counts to report total wc for collection :)
let $wc := for $c in //*:wordcount/@wc
  return number($c)
return sum($wc)