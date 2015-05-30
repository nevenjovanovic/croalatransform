copy $a := //*:m
modify (
  rename node $a as 'csv',
  for $b at $o in $a/tr return insert node $o - 1 into $b/item[@class='philodocid']
)
return file:write("/home/neven/rad/2015-02-14-croala-bibliography.txt",csv:serialize($a, map { 'separator': 'tab' } ))