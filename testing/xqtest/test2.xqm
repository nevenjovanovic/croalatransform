module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at 'file://home/neven/basex/repo/croala.xqm';


(: return info on the db :)
declare %unit:test function test:croalabibwpersonaepage() {
  fetch:xml("http://localhost:8984/basex/wpersonae")
};
declare %unit:test function test:croalabib-wpersonae-title() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//*:title[.='CroALaBib personae in wikidata'])
};
declare %unit:test function test:croalabib-wpersonae-jumbotron-dbinfo() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//*:div[@class='jumbotron']/div[@class='container-fluid']/div[contains(@class,'dbinfo')])
};
declare %unit:test function test:croalabib-wdata-invoke-function-listwpersons() {
  unit:assert(croala:getwdatapersons()//*:persName)
};

declare %unit:test function test:croalabib-wdata-invoke-function-listwpersons-event() {
  unit:assert(not(empty(croala:getwdatapersons()//*:td[3])))
};

declare %unit:test function test:croalabib-wpersonae-body-table-head() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/thead/tr/td[.='Nomina'])
};
declare %unit:test function test:croalabib-wpersonae-body-table-head-td2() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/thead/tr/td[2][.='Wikidata'])
};
declare %unit:test function test:croalabib-wpersonae-body-table-head-td3() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/thead/tr/td[3][.='In fabula'])
};

declare %unit:test function test:croalabib-wpersonae-body-table() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/tbody/tr/td)
};

declare %unit:test function test:croalabib-wpersonae-body-table-td2() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/tbody/tr/td[2][contains(a[contains(@href,'wikidata')], 'Q')])
};
declare %unit:test function test:croalabib-wpersonae-body-table-td3() {
  let $page := doc("http://localhost:8984/basex/wpersonae")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/tbody/tr/td[3][a[contains(@href,'/basex/dramata/')] or text()='N/A'])
};

declare %unit:test function test:croalabib-wdata-invoke-function-drama-title() {
  unit:assert(croala:dramatitlepage('croala.drama.1609.abrahamus')/*:bibl)
};

declare %unit:test function test:croalabib-drama-title-page() {
  let $page := doc("http://localhost:8984/basex/dramata/dummy")
  return unit:assert($page)
};

declare %unit:test function test:croalabib-drama-page-title() {
  let $dummy := 'dummy'
  let $page := doc("http://localhost:8984/basex/dramata/" || $dummy )
  return unit:assert($page//*:title[.=$dummy])
};

declare %unit:test function test:croalabib-drama-page-infodiv() {
  let $dummy := 'croala.drama.1609.abrahamus'
  let $page := doc("http://localhost:8984/basex/dramata/" || $dummy )
  return unit:assert($page//*:div[@class='dramainfo']/*:bibl)
};