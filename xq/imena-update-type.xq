declare namespace croala='http://croala.ffzg.unizg.hr';
declare %updating function croala:upd($ime) {
  for $a in collection("imena")//*:name/text()[matches(.,$ime)]
  return insert node (attribute { 'type' } { 'pers' }) into $a/..
};
(: update node with attribute @type :)
let $ime := "aegle"
return croala:upd($ime)