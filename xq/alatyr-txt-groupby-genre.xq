declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";
declare function croala:gen ($collection) {
for $i in distinct-values(collection($collection)//*:keywords[@scheme='genre']/*:term)
order by $i
let $count := count(collection($collection)//*:keywords[@scheme='genre']/*:term[text() eq $i])
return element tr {
element td { $i } , 
element td { $count }
 }
};
element table {
  croala:gen("latty")
},
element table {
croala:gen("croala")
}