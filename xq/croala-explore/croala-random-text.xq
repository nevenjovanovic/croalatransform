(: display random text from croala collection :)
(: todo - turn collection of passages into a db :)
(: todo - write as restxq request :)
(: todo - add links to orginal file :)
let $rnd := random:integer(56530) + 1
return collection("croala-lectio")//item[$rnd]